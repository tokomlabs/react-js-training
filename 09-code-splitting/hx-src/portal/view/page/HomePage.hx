package portal.view.page;

import api.react.ReactComponent;
import api.react.ReactMacro.jsx;

import api.react.addon.ReactRedux;

import api.react.addon.router.Link;

typedef HomePageProps = {
	? dispatch : Dynamic -> Void,
	? user : String
}

class HomePage extends ReactComponentOf<HomePageProps, Dynamic, Dynamic> {

	static public var Reduxed : HomePage = ReactRedux.connect(mapStateToProps)(HomePage);

	static public function mapStateToProps(st : Dynamic, ownProps : HomePageProps) : HomePageProps {

		return { user: st.portal.user }
	}

	function loginCb() {

		props.dispatch({ type: "login", user: "Thomas" });
	}

	function renderPageContent() {

		if (props.user == null) {

			return jsx('
				<div>
					Please login first: <button onClick={loginCb}>LOGIN</button>
				</div>
			');
		}

		return jsx('
			<div>
				<p>Welcome ${props.user}</p>
				<Link to="/app1">Go to App 1</Link><br />
				<Link to="/app2">Go to App 2</Link><br />
			</div>
		');
	}

	override function render() {

		return jsx('
			<div>
				<h1>Portal Main Menu</h1>
				{ renderPageContent() }
			</div>
		');
	}
}
