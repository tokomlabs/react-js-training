package app02;

import api.react.ReactComponent;
import api.react.ReactMacro.jsx;

import api.react.addon.ReactRedux;
import js.npm.ReduxLogger;

import api.react.addon.router.Route;
import api.react.addon.router.IndexRoute;

import app02.view.layout.App02Layout;
import app02.view.page.HomePage;

@:expose
class App02 {

	static public var indexRoute = { component: HomePage };

	static public var routeComponent = App02Layout;

	static public var childRoutes = [ ];
}
