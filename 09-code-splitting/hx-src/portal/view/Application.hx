package portal.view;

import api.react.ReactComponent;
import api.react.ReactMacro.jsx;

import api.react.addon.ReactRouter;
import api.react.addon.router.Router;
import api.react.addon.router.Route;
import api.react.addon.router.IndexRoute;

import portal.view.layout.PortalLayout;
import portal.view.page.HomePage;

class Application extends ReactComponentOf<Dynamic, Dynamic, Dynamic> {

	static function moduleFailed(name : String) {

		js.Browser.console.error('$name module loading failed!');
	}

	static function getApp01IndexRoute(location : Dynamic, callback : Dynamic -> Dynamic -> Void) {

		js.Browser.console.log('getApp01IndexRoute',location);

		Require.module('./app01').then(

			function(name:String) {

				trace('app01 module loaded!');

				callback(null, app01.App01.indexRoute);
			}, 

			moduleFailed);
	}

	static function getApp01Component(location : Dynamic, callback : Dynamic -> Dynamic -> Void) {

		js.Browser.console.log('getApp01Component',location);

		Require.module('./app01').then(

			function(name:String) {

				trace('app01 module loaded!');

				callback(null, app01.App01.routeComponent);
			}, 

			moduleFailed);
	}

	static function getApp01Routes(location : Dynamic, callback : Dynamic -> Dynamic -> Void) {

		js.Browser.console.log('getApp01Routes',location);

		Require.module('./app01').then(

			function(name:String) {

				trace('app01 module loaded!');

				callback(null, app01.App01.childRoutes);
			}, 

			moduleFailed);
	}

	static function getApp02IndexRoute(location : Dynamic, callback : Dynamic -> Dynamic -> Void) {

		js.Browser.console.log('getApp02IndexRoute',location);

		Require.module('./app02').then(

			function(name:String) {

				trace('app02 module loaded!');

				callback(null, app02.App02.indexRoute);
			}, 

			moduleFailed);
	}

	static function getApp02Component(location : Dynamic, callback : Dynamic -> Dynamic -> Void) {

		js.Browser.console.log('getApp02Component',location);

		Require.module('./app02').then(

			function(name:String) {

				trace('app02 module loaded!');

				callback(null, app02.App02.routeComponent);
			}, 

			moduleFailed);
	}

	static function getApp02Routes(location : Dynamic, callback : Dynamic -> Dynamic -> Void) {

		js.Browser.console.log('getApp02Routes',location);

		Require.module('./app02').then(

			function(name:String) {

				trace('app02 module loaded!');

				callback(null, app02.App02.childRoutes);
			}, 

			moduleFailed);
	}

	static var rootRoute = untyped

		{
		  childRoutes: [ {
		    path: '/',
		    component: PortalLayout,
		    indexRoute: {
		    	component: HomePage
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

	static var router : Dynamic = 

    	jsx('
			<Router history={ReactRouter.browserHistory}
					routes={rootRoute} />
        ');

    override function render() {

    	return router;
    }
}