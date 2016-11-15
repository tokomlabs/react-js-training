package app01;

import api.react.ReactComponent;
import api.react.ReactMacro.jsx;

import api.react.addon.ReactRedux;
import js.npm.ReduxLogger;

import api.react.addon.router.Route;
import api.react.addon.router.IndexRoute;

import app01.view.layout.App01Layout;
import app01.view.page.HomePage;
import app01.view.page.Page01;
import app01.view.page.Page02;
import app01.view.page.Page03;

@:expose
class App01 {

	static public var indexRoute = { component: HomePage };

	static public var routeComponent = App01Layout;

	static public var childRoutes = 

		[
			jsx('<Route path="01" component={Page01.Reduxed} />'),
			jsx('<Route path="02" component={Page02} />'),
			jsx('<Route path="03" component={Page03} />')
		];

	static public function createReducer() {

		trace("app01 createReducer()");

		// note: we could have anything here, like a call to Redux.combineReducers()

		return app01.rdcr.App01Rdcr.execute;
	}
}
