package portal.view.router;

import api.react.ReactComponent;
import api.react.ReactMacro.jsx;

import api.react.addon.ReactRouter;
import api.react.addon.router.Router;
import api.react.addon.router.Route;
import api.react.addon.router.IndexRoute;

import portal.view.layout.PortalLayout;
import portal.view.page.HomePage;

typedef PortalRouterProps = {
	injectAsyncReducer: String -> Dynamic -> Void
}

class PortalRouter extends ReactComponentOf<PortalRouterProps, Dynamic, Dynamic> {

	function moduleFailed(name : String) {

		js.Browser.console.error('$name module loading failed!');
	}

	function getApp01IndexRoute(location : Dynamic, callback : Dynamic -> Dynamic -> Void) {

		js.Browser.console.log('getApp01IndexRoute',location);

		Require.module('./app01').then(

			function(name:String) {

				trace('app01 module loaded!');

				callback(null, app01.App01.indexRoute);
			}, 

			moduleFailed);
	}

	function getApp01Component(location : Dynamic, callback : Dynamic -> Dynamic -> Void) {

		js.Browser.console.log('getApp01Component',location);

		Require.module('./app01').then(

			function(name:String) {

				trace('app01 module loaded!');

				props.injectAsyncReducer("app1", app01.App01.createReducer());

				callback(null, app01.App01.routeComponent);
			}, 

			moduleFailed);
	}

	function getApp01Routes(location : Dynamic, callback : Dynamic -> Dynamic -> Void) {

		js.Browser.console.log('getApp01Routes',location);

		Require.module('./app01').then(

			function(name:String) {

				trace('app01 module loaded!');

				callback(null, app01.App01.childRoutes);
			}, 

			moduleFailed);
	}

	function getApp02IndexRoute(location : Dynamic, callback : Dynamic -> Dynamic -> Void) {

		js.Browser.console.log('getApp02IndexRoute',location);

		Require.module('./app02').then(

			function(name:String) {

				trace('app02 module loaded!');

				callback(null, app02.App02.indexRoute);
			}, 

			moduleFailed);
	}

	function getApp02Component(location : Dynamic, callback : Dynamic -> Dynamic -> Void) {

		js.Browser.console.log('getApp02Component',location);

		Require.module('./app02').then(

			function(name:String) {

				trace('app02 module loaded!');

				callback(null, app02.App02.routeComponent);
			}, 

			moduleFailed);
	}

	function getApp02Routes(location : Dynamic, callback : Dynamic -> Dynamic -> Void) {

		js.Browser.console.log('getApp02Routes',location);

		Require.module('./app02').then(

			function(name:String) {

				trace('app02 module loaded!');

				callback(null, app02.App02.childRoutes);
			}, 

			moduleFailed);
	}

	function getRootRoute() {

		return

			{
			  childRoutes: [ {
			    path: '/',
			    component: PortalLayout.Reduxed,
			    indexRoute: {
			    	component: HomePage.Reduxed
			    },
			    childRoutes: [
			        {
					  path: 'app1',
					  getIndexRoute: getApp01IndexRoute,
					  getChildRoutes: getApp01Routes,
					  getComponent: getApp01Component
					},
			        {
					  path: 'app2',
					  getIndexRoute: getApp02IndexRoute,
					  getChildRoutes: getApp02Routes,
					  getComponent: getApp02Component
					}
			    ]
			  } ]
			}
	}

	var router : Dynamic = null;

	function getRouter() {

		if (router == null) {

			router = 

				jsx('
					<Router history={ReactRouter.browserHistory}
							routes={getRootRoute()} />
		        ');
		}
		return router;
	}

	override function render() {

		return getRouter();
	}
}
