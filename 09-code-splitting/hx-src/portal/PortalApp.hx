package portal;

import api.react.ReactComponent;
import api.react.ReactMacro.jsx;
import api.react.ReactDOM;

import api.react.addon.ReactRedux;
import js.npm.ReduxLogger;

import portal.view.Application;

class PortalApp {

	// static var store : Dynamic;

	// // TODO this should better be in a separate file
	// static function initStore() {

	// 	var initialRegistration : RegistrationFormData = 

	// 		{ 
	// 			firstName: '',
	// 			lastName: '',
	// 			email: '',
	// 			pass: '',
	// 			confirmPass: ''
	// 		};

	// 	var initialLogin : LoginFormData = 

	// 		{ 
	// 			email: '',
	// 			password: ''
	// 		};

	// 	return 

	// 		js.npm.Redux.createStore(

	// 			ReactReduxForm.combineForms(

	// 			{
	// 				registration: initialRegistration,
	// 				login: initialLogin
	// 			}),

	// 			js.npm.Redux.applyMiddleware(ReduxThunk,ReduxLogger.createLogger())
	// 		);
	// }

	static function main() {

		// 1 init Redux store

		// store = initStore();

		// 2 boot React app

		// ReactDOM.render(
					
		// 	jsx('
		// 		<Provider store={store}>
		// 			<Application />
		// 		</Provider>
		// 	'),

		// 	js.Browser.document.querySelector("#app"));

		ReactDOM.render(
					
			jsx('
				<Application />
			'),

			js.Browser.document.querySelector("#app"));
	}
}
