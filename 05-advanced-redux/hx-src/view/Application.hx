package view;

import api.react.ReactComponent;
import api.react.ReactMacro.jsx;

import api.react.addon.ReactRouter;
import api.react.addon.router.Router;
import api.react.addon.router.IndexRoute;
import api.react.addon.router.Route;

import view.layout.MyLayout;
import view.page.ScenariosPage;
import view.page.ScenarioPage;

class Application extends ReactComponentOf<Dynamic, Dynamic, Dynamic> {

	static var router : Dynamic = 

    	jsx('
			<Router history={ReactRouter.hashHistory}>
				<Route path="/" component={MyLayout}>
					<IndexRoute component={ScenariosPage.Reduxed} />
					<Route path=":id" component={ScenarioPage.Reduxed} />
				</Route>
			</Router>
        ');

    override function render() {

    	return router;
    }
}