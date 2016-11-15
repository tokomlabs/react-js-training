package app01.view.layout;

import api.react.ReactComponent;
import api.react.ReactMacro.jsx;

import api.react.addon.router.Link;

import api.react.addon.ReactRedux;

import api.react.addon.intl.IntlProvider;

typedef App01LayoutProps = {
	locale : String
}

class App01Layout extends ReactComponentOf<App01LayoutProps, Dynamic, Dynamic> {

	static public var Reduxed : App01Layout = ReactRedux.connect(mapStateToProps)(App01Layout);

	static function mapStateToProps(st : Dynamic, ownProps : App01LayoutProps) : App01LayoutProps {

		return { locale: st.common.locale }
	}

	static function messages() {

		return 

			[ 
				"fr" => js.Lib.require('../app/lang/app01-fr.json'),
				"en" => js.Lib.require('../app/lang/app01-en.json')
			];
	}

	override function render() {

		var msgs = messages().get(props.locale);

		return jsx('
			<IntlProvider messages={msgs}>
				<div className="page">

					<div className="header">
						App 01 Header
					</div>

					<div className="content">
						{ props.children }
					</div>

					<div className="footer">
						App 01 tool bar - 
						<Link to="/app1/01">page 01</Link> - <Link to="/app1/02">Page 02</Link> - <Link to="/app1/03">Page 03</Link>
					</div>

				</div>
			</IntlProvider>
		');
	}
}
