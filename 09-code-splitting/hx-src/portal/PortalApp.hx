package portal;

import api.react.ReactComponent;
import api.react.ReactMacro.jsx;
import api.react.ReactDOM;

import api.react.addon.ReactRedux;
import js.npm.ReduxLogger;

import portal.view.Application;

class PortalApp {

	static var store : Dynamic;

	// TODO this should better be in a separate file ***
	static var initialRdcrs : Dynamic = 

		{
			portal: portal.rdcr.PortalRdcr.execute,
			common: common.rdcr.CommonRdcr.execute
		}

	static var asyncRdcrs : Dynamic = { }

	static function createReducer() {
		
		return js.npm.Redux.combineReducers(js.Object.assign({},initialRdcrs,asyncRdcrs));
	}

	static function initStore() {

		return 

			js.npm.Redux.createStore(

				createReducer(),

				js.npm.Redux.applyMiddleware(ReduxLogger.createLogger())
			);
	}

	static function injectAsyncReducer(name : String, asyncReducer : Dynamic) {
	
		Reflect.setField(asyncRdcrs,name,asyncReducer);
	
		store.replaceReducer(createReducer());
	}
	// ************** ************** ************** *******

	static function main() {

		// 1 init Redux store

		store = initStore();

		// 2 boot React app

		ReactDOM.render(
					
			jsx('
				<Provider store={store}>
					<Application.Reduxed injectAsyncReducer={injectAsyncReducer} />
				</Provider>
			'),

			js.Browser.document.querySelector("#app"));
	}
}
