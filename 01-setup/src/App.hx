package ;

import api.react.ReactComponent;
import api.react.ReactMacro.jsx;
import api.react.ReactDOM;

class App {

	static function main() {

		ReactDOM.render(
					
			jsx('
				<HelloWorld />
			'),

			js.Browser.document.querySelector("#app"));
	}
}

class HelloWorld extends ReactComponentOf<Dynamic, Dynamic, Dynamic> {

	override function render() {

		return jsx('
			<div>Hello world!</div>
		');
	}
}