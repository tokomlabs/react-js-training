package ;

import api.react.ReactComponent;
import api.react.ReactMacro.jsx;
import api.react.ReactDOM;

class App02 {

	static function main() {

		ReactDOM.render(
					
			jsx('
				<HelloWorld />
			'),

			js.Browser.document.querySelector("#app"));
	}
}

typedef HelloWorldProps = {

}

typedef HelloWorldState = {
	? name : String
}

typedef HelloWorldRefs = {
	mi : js.html.InputElement
}

class HelloWorld extends ReactComponentOf<HelloWorldProps, HelloWorldState, HelloWorldRefs> {

	public function new(p : HelloWorldProps) {

		super(p);

		this.state = { name: "world" };
	}

	function renderName(name : String) {

		if (name.length < 5) return null;

		return jsx('
			<div>Hello { name } !</div>
		');
	}

	function setName(e : js.html.Event) {

		// var mi : js.html.InputElement = Std.instance(e.target, js.html.InputElement);

		// setState({ name: mi.value });
		
		setState({ name: refs.mi.value });
		
		// Bad !!!
		// state.name = mi.value;
	}

	function renderInput() {

		return jsx('
			<div>
				<input type="text"
					   onChange={ setName }
					   ref="mi" />
			</div>
		');
	}

	override function render() { trace('render $state');

		return jsx('
			<div>
				{ renderInput() } 
				{ renderName(state.name) }
			</div>
		');
	}
}