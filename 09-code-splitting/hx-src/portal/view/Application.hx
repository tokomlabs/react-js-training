package portal.view;

import api.react.ReactComponent;
import api.react.ReactMacro.jsx;

import api.react.addon.ReactRedux;

import api.react.addon.ReactIntl;
import api.react.addon.intl.IntlProvider;
import api.react.addon.intl.ReactIntlLocaleData;

import portal.view.router.PortalRouter;

typedef ApplicationProps = {
	locale : String,
	? injectAsyncReducer: String -> Dynamic -> Void
}

class Application extends ReactComponentOf<ApplicationProps, Dynamic, Dynamic> {

	static public var Reduxed : Application = ReactRedux.connect(mapStateToProps)(Application);

	static function mapStateToProps(st : Dynamic, ownProps : ApplicationProps) : ApplicationProps {

		return { locale: st.common.locale }
	}

	static function messages() {

		return 

			[ 
				"fr" => js.Lib.require('../app/lang/portal-fr.json'),
				"en" => js.Lib.require('../app/lang/portal-en.json')
			];
	}

	public function new(p) {

		super(p);

		ReactIntl.addLocaleData(ReactIntlLocaleData.en);
		ReactIntl.addLocaleData(ReactIntlLocaleData.fr);
	}

    override function render() {

    	var msgs = messages().get(props.locale); trace(msgs);

    	return jsx('
			<IntlProvider locale={props.locale} messages={msgs}>
				<PortalRouter injectAsyncReducer={props.injectAsyncReducer} />
			</IntlProvider>
    	');
    }
}