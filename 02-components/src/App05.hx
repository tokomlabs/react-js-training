package ;

import api.react.ReactComponent;
import api.react.ReactMacro.jsx;
import api.react.ReactDOM;

class App05 {

	static function main() {

		var myVar = { toto: 5, tutu: "Hi" }

		ReactDOM.render(
					
			jsx('
				<div>
					<MyButton.Reduxed toto={5} tutu="Hi" text="Bouton" />
					<MyLabel {...myVar} text="Label" />
				</div>
			'),

			js.Browser.document.querySelector("#app"));
	}
}


class MyButton extends ReactComponentOf<Dynamic, Dynamic, Dynamic> {

	static var Enriched = withRouter(withIntl(withRedux(MyButton))); //

	// static var Routed = withRouter(MyButton);

	// static var Intled = withIntl(MyButton.Routed);

	// static var Reduxed = withRedux(MyButton.Intled);

	override function render() {

		return jsx('
			<div>
				<button>{ props.text }</button>
			</div>
		');
	}
}

class MyLabel extends ReactComponentOf<Dynamic, Dynamic, Dynamic> {

	override function render() {

		return jsx('
			<div>
				<label>{ props.text }</label>
			</div>
		');
	}
}

