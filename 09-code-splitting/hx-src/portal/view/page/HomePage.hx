package portal.view.page;

import api.react.ReactComponent;
import api.react.ReactMacro.jsx;

import api.react.addon.ReactRedux;

import api.react.addon.router.Link;

import api.react.addon.intl.FormattedMessage;

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
					<FormattedMessage id="login" /><button onClick={loginCb}>LOGIN</button>
				</div>
			');
		}

		return jsx('
			<div>
				<p><FormattedMessage id="welcome" values={{ name: props.user }} /></p>
				<Link to="app1"><FormattedMessage id="gotoapp1" /></Link><br />
				<Link to="app2"><FormattedMessage id="gotoapp2" /></Link><br />
			</div>
		');
	}

	override function render() {

		return jsx('
			<div>
				<h1><FormattedMessage id="portal_title" /></h1>
				{ renderPageContent() }
			</div>
		');
	}
}
