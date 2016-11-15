package portal.view.layout;

import api.react.ReactComponent;
import api.react.ReactMacro.jsx;

import api.react.addon.ReactRedux;

import api.react.addon.router.Link;

typedef PortalLayoutProps = {
	dispatch : Dynamic -> Void
}

class PortalLayout extends ReactComponentOf<PortalLayoutProps, Dynamic, Dynamic> {

	static public var Reduxed : PortalLayout = ReactRedux.connect()(PortalLayout);

	function frCb() {

		props.dispatch({ type: "set_lang", lang: "fr" });
	}

	function enCb() {

		props.dispatch({ type: "set_lang", lang: "en" });
	}

	override function render() {

		return jsx('
			<div className="page">

				<div className="header">
					HERAKLES PORTAL - <button onClick={frCb}>FR</button> - <button onClick={enCb}>EN</button> - 
				</div>

				<div className="content">
					{ props.children }
				</div>

				<div className="footer">
					<Link to="/app1">App 1</Link> - <Link to="/app2">App 2</Link> - <Link to="/">Home</Link>
				</div>

			</div>
		');
	}
}
