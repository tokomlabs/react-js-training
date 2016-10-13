package ;

import api.react.ReactComponent;
import api.react.ReactMacro.jsx;
import api.react.ReactDOM;

class App01 {

	static function main() {

		ReactDOM.render(
					
			jsx('
				<HelloWorld name="Jeff" times={12} />
			'),

			js.Browser.document.querySelector("#app"));
	}
}

typedef HelloWorldProps = {
	? name : String,
	? times : Int
}

class HelloWorld extends ReactComponentOf<HelloWorldProps, Dynamic, Dynamic> {

	function renderName(name : String) {

		// if (name.length < 5) return null;

		return jsx('
			<div>Hello { name } !</div>
		');
	}

	function renderNameTimes(? name : String = "world", ? times : Int = 1) {

		return jsx('
			<div>
				{ [ for(i in 0...times) renderName(name) ] }
			</div>
		');
	}

	override function render() {

		return jsx('
			<div>
				{ renderNameTimes(props.name, props.times) }
			</div>
		');
	}
}