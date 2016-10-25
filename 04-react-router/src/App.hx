package ;

import api.react.ReactComponent;
import api.react.ReactMacro.jsx;
import api.react.ReactDOM;

import api.react.addon.ReactRouter;
import api.react.addon.router.Router;
import api.react.addon.router.IndexRoute;
import api.react.addon.router.Route;
import api.react.addon.router.Redirect;
import api.react.addon.router.Link;


class App {

	static function main() {

		ReactDOM.render(
					
			jsx('
				<Application />
			'),

			js.Browser.document.querySelector("#app"));
	}
}

class Application extends ReactComponentOf<Dynamic, Dynamic, Dynamic> {

	static var router : Dynamic = 

    	jsx('
			<Router history={ReactRouter.browserHistory}>
				<Route path="/" component={MyLayout}>
					<IndexRoute component={HomePage} />
					<Route path="p01" component={Page01} />
					<Route path="p02" component={Page02} />
					<Route path="p03" component={Page03.Routed} />
					<Route path="p/:id" component={PageN} />
					<Route path="p/:id(/:id2)" component={PageN2} />
					<Redirect path="old-page" to="p02" />
				</Route>
			</Router>
        ');

    override function render() {

    	return router;
    }
}

class MyLayout extends ReactComponentOf<Dynamic, Dynamic, Dynamic> {

	override function render() {

		return jsx('
			<div className="page">

				<div className="header">
					HERAKLES PORTAL
				</div>

				<div className="content">
					{ props.children }
				</div>

				<div className="footer">
					<Link to="/p01">Page 1</Link> - 
					<Link to="/p02">Page 2</Link> - 
					<Link to="/p03">Page 3</Link> - 
					<Link to="/p/42">Page 42</Link> - 
					<Link to="/p/44/54">Page other</Link> - 
					<Link to="/p/44">Page other light</Link> - 
					<Link to="/old-page">Old page</Link>
				</div>

			</div>
		');
	}
}

class HomePage extends ReactComponentOf<Dynamic, Dynamic, Dynamic> {

	override function render() {

		return jsx('
			<div>
				<h1>Main Menu</h1>
				<Link to="/p01">Go to Page 1</Link><br />
				<Link to="/p02">Go to Page 2</Link><br />
				<Link to="/p03">Go to Page 3</Link><br />
			</div>
		');
	}
}

class Page01 extends ReactComponentOf<Dynamic, Dynamic, Dynamic> {

	override function render() {

		return jsx('
			<div>
				Welcome to page 01
			</div>
		');
	}
}

class Page02 extends ReactComponentOf<Dynamic, Dynamic, Dynamic> {

	override function render() {

		return jsx('
			<div>
				Welcome to page 02
			</div>
		');
	}
}

typedef Page03Props = {
	router : Dynamic
}

class Page03 extends ReactComponentOf<Page03Props, Dynamic, Dynamic> {

	static var Routed : Page03 = ReactRouter.withRouter(Page03);

	function goToRandomPage() {

		var rd : String = Std.string(Math.floor(Math.random()*100));

		props.router.push('/p/$rd');
	}

	override function render() {

		return jsx('
			<div>
				Welcome to page 03

				<button onClick={goToRandomPage}>Go to random page</button>
			</div>
		');
	}
}

typedef PageNProps = {
	params : {
		id : String
	}
}

class PageN extends ReactComponentOf<PageNProps, Dynamic, Dynamic> {

	override function render() {

		return jsx('
			<div>
				Welcome to page {props.params.id}
			</div>
		');
	}
}

typedef PageN2Props = {
	params : {
		id : String,
		? id2 : String
	}
}

class PageN2 extends ReactComponentOf<PageN2Props, Dynamic, Dynamic> {

	override function render() {

		return jsx('
			<div>
				Welcome to PageN2 with params {props.params.id} and {props.params.id2}
			</div>
		');
	}
}
