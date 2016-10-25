package ;

import api.react.ReactMacro.jsx;
import api.react.ReactDOM;

import api.react.addon.ReactRedux;
import js.npm.ReduxThunk;

import view.Application;

class App {

	static var store : Dynamic;

	// TODO this should better be in a separate file
	static function initStore() {

		return 

			js.npm.Redux.createStore(

				js.npm.Redux.combineReducers(

					{
						scenarios: rdcr.ScenariosRdcr.execute
					}
				),

				js.npm.Redux.applyMiddleware(ReduxThunk)
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

			js.Browser.document.querySelector("#root"));
	}
}
