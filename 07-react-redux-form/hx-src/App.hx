package ;

import api.react.ReactComponent;
import api.react.ReactMacro.jsx;
import api.react.ReactDOM;

import api.react.addon.ReactRedux;
import api.react.addon.ReactReduxForm;
import js.npm.ReduxThunk;
import js.npm.ReduxLogger;

import api.react.addon.rrf.Form;
import api.react.addon.rrf.Control;
import api.react.addon.rrf.Errors;

// import { isName, isEmail, isRequired, isPass, match } from '../validation/myValidators';

typedef RegistrationFormData = {
	firstName : String,
	lastName : String,
	email : String,
	pass : String,
	confirmPass : String
}

typedef LoginFormData = {
	email : String,
	password : String
}


class App {

	static var store : Dynamic;

	// TODO this should better be in a separate file
	static function initStore() {

		var initialRegistration : RegistrationFormData = 

			{ 
				firstName: '',
				lastName: '',
				email: '',
				pass: '',
				confirmPass: ''
			};

		var initialLogin : LoginFormData = 

			{ 
				email: '',
				password: ''
			};

		return 

			js.npm.Redux.createStore(

				ReactReduxForm.combineForms(

				{
					registration: initialRegistration,
					login: initialLogin
				}),

				js.npm.Redux.applyMiddleware(ReduxThunk,ReduxLogger.createLogger())
			);
	}

	static function main() {

		// 1 init Redux store

		store = initStore();

		// 2 boot React app

		ReactDOM.render(
					
			jsx('
				<Provider store={store}>
					<Application />
				</Provider>
			'),

			js.Browser.document.querySelector("#app"));
	}
}


class Application extends ReactComponentOf<Dynamic, Dynamic, Dynamic> {

	override function render() {

    	return jsx('
    		<div>
    			<h1>Welcome to my app!</h1>
    			<MyForm.Reduxed />
    		</div>
    	');
    }
}

class Validators {

	static public function isValidName(v : String) : Bool {

		return ~/^[A-Za-z]{5,20}$/.match(v);
	}

	static public function isEmail(v : String) : Bool {

		return js.npm.Validator.isEmail(v);
	}

	static public function match(v1 : String, v2 : String) : Bool {

		return v1 == v2;
	}

	static public function isNotEmpty(v : Null<String>) : Bool { trace('isNotEmpty *${v}*');

		var ret = v != null && v.length != 0;

		trace(ret);

		return ret;
	}
}

typedef MyFormProps = {
	dispatch : Dynamic -> Void
}

class MyForm extends ReactComponentOf<MyFormProps, Dynamic, Dynamic> {

	static public var Reduxed : MyForm = ReactRedux.connect()(MyForm);

	function simulateApiError() {

		haxe.Timer.delay(

			function(){

				props.dispatch(
					// ReactReduxForm.actions.setValidity('registration', { api: false })
					ReactReduxForm.actions.setErrors('registration', "Email already used")
				);
			},

			1000);

	}

	function handleSubmit(val : RegistrationFormData) {

		js.Browser.console.log('handleSubmit',val);

		simulateApiError();
	}

	function passMatch(val : RegistrationFormData) : Bool {

		js.Browser.console.log('passMatch',val);

		return Validators.match(val.pass, val.confirmPass);
	}

	override function render() {

// validators={ { "": { passMatch: (val) => match(val.pass,val.confirmPass) } } }
// validateOn="submit"


// validators={ { isName, isRequired } }
// 	                        validateOn="blur"
    	return jsx('
    		<Form model="registration"
	              onSubmit={handleSubmit}
	              validators={{ "": { passMatch: passMatch } }}
				  validateOn="submit" >

	        <div>
	          <label>First name:</label>
	          <Control.text model="registration.firstName"
	          				validators={{ name: Validators.isValidName }}
	            			validateOn="blur" />
	          <Errors
		          model="registration.firstName"
		          messages={{
		            name: "Names can contain only letters",
		          }}
		          show={function(field){ return field.touched && !field.focus; }}
		        />
	          
	        </div>

	        <div>
	          <label>Last name:</label>
	          <Control.text model="registration.lastName" />
	        </div>

	        <div>
	          <label>Email:</label>
	          <Control.text
	            type="email"
	            model="registration.email"
	            validators={{
	            	email: Validators.isEmail
	            }}
	            validateOn="blur"
	          />
	          <Errors
		          model="registration.email"
		          messages={{
		            email: "Please provide a valid email",
		          }}
		          show={function(field){ return field.touched && !field.focus; }}
		        />
	        </div>

	        <div>
	          <label>Password:</label>
	          <Control.text
	            type="password"
	            model="registration.pass"
	            validators={{
	            	empty: Validators.isNotEmpty
	            }}
	            validateOn="blur"
	          />
	          <Errors
		          model="registration.pass"
		          messages={{
		            empty: "Please provide a valid password",
		          }}
		          show={function(field){ return field.touched && !field.focus; }}
		        />
	        </div>
	        <div>
	          <label>Confirm password:</label>
	          <Control.text
	            type="password"
	            model="registration.confirmPass"
	          />
	          <Errors
		          model="registration"
		          messages={{
		            passMatch: "The passwords do not match",
		            api: "An error occurred, try again later"
		          }}
		        />
	        </div>

	        <button type="submit">
	          Finish registration!
	        </button>
	      </Form>
    	');
    }
}
