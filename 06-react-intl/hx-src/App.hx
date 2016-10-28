package ;

import api.react.ReactComponent;
import api.react.ReactMacro.jsx;
import api.react.ReactDOM;

import api.react.addon.ReactIntl;
import api.react.addon.intl.IntlProvider;
import api.react.addon.intl.FormattedMessage;
import api.react.addon.intl.ReactIntlLocaleData;

class App {

	static function main() {

		ReactDOM.render(
					
			jsx('
				<Application />
			'),

			js.Browser.document.querySelector("#app"));
	}
}

typedef ApplicationState = {
	lang : String
}

class Application extends ReactComponentOf<Dynamic, ApplicationState, Dynamic> {

	static function messages() {

		return 

			[ 
				"fr" => js.Lib.require('../app/lang/fr.json'),
				"en" => js.Lib.require('../app/lang/en.json')
			];
	}

	public function new(p) {

		super(p);

		state = 

			{
				lang: "fr"
			}
	}

	override function componentWillMount() {

		ReactIntl.addLocaleData(ReactIntlLocaleData.en);
		ReactIntl.addLocaleData(ReactIntlLocaleData.fr);
	}

	function changeLangCb(l : String) {

		if (state.lang == l) return;

		setState(js.Object.assign({},state,{ lang: l }));
	}

	override function render() {

		var cnt : Int = Math.floor(Math.random() * 10);

		var msgs = messages().get(state.lang);

    	return jsx('
    		<IntlProvider locale={state.lang} messages={msgs}>
    			<div>
	    			<div>
	    				<h1><FormattedMessage id="greetings" values={{ name: "Thomas" }} /></h1>
	    				<p><FormattedMessage id="msg-count" values={{ count: cnt }} /></p>
	    			</div>
	    			<div>
	    				<button onClick={function(){ changeLangCb("fr"); }}>FR</button>
	    				<button onClick={function(){ changeLangCb("en"); }}>EN</button>
	    			</div>
	    			<QuestionInput.Intled />
    			</div>
    		</IntlProvider>
    	');
    }
}

typedef QuestionInputProps = {
	intl : api.react.addon.intl.IntlShape
}

class QuestionInput extends ReactComponentOf<QuestionInputProps, Dynamic, Dynamic> {

	static public var Intled : QuestionInput = ReactIntl.injectIntl(QuestionInput);

	override function render() {

		// var ans01 = jsx('<FormattedMessage id="ans01" />');
		var ans01 = props.intl.formatMessage({ id: "ans01" });
		// var ans02 = jsx('<FormattedMessage id="ans02" />');
		var ans02 = props.intl.formatMessage({ id: "ans02" });
		// var ans03 = jsx('<FormattedMessage id="ans03" />');
		var ans03 = props.intl.formatMessage({ id: "ans03" });

		return jsx('
			<div>
				<label><FormattedMessage id="question-label" /></label>
				<select>
					<option label={ans01} value={1} />
					<option label={ans02} value={2} />
					<option label={ans03} value={3} />
				</select>
			</div>
		');
	}
}