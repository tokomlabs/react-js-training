package ;

import api.react.ReactComponent;
import api.react.ReactMacro.jsx;
import api.react.ReactDOM;

class App04 {

	static function main() {

		ReactDOM.render(
					
			jsx('
				<PersonList />
			'),

			js.Browser.document.querySelector("#app"));
	}
}

typedef PersonListProps = { }

typedef PersonListState = {
	list : Array<String>
}

typedef PersonListRefs = {
	mi : js.html.InputElement
}

class PersonList extends ReactComponentOf<PersonListProps, PersonListState, PersonListRefs> {

	public function new(p : PersonListProps) {

		super(p);

		this.state = { list: [] };
	}

	override function shouldComponentUpdate(nextProps : PersonListProps, nextState : PersonListState) : Bool {

		trace('shouldComponentUpdate');

		return nextState.list.length % 2 == 0;
	}

	function renderItem(n : String) {

		return jsx('
			<PersonItem name={n} onDelete={function(){ deletePerson(n); }} />
		');
	}

	function renderList() {

		if (state.list.length == 0) {

			return jsx('
				<div>La liste est vide</div>
			');
		}

		return jsx('
			<div>{ [ for (n in state.list) renderItem(n) ] }</div>
		');
	}

	function deletePerson(n : String) {

		setState({ list: state.list.filter(function(it){ return it != n; }) });
	}

	function addPerson() {

		setState({ list: state.list.concat([ refs.mi.value ]) });

		// var ns : PersonListState = state;

		// ns.list.push(refs.mi.value);
		
		// setState(ns);
	}

	function renderInput() {

		return jsx('
			<div>
				<input type="text"
					   ref="mi" />
				<button onClick={ addPerson }>Add</button>
			</div>
		');
	}

	override function componentWillReceiveProps(nextProps : PersonListProps) : Void {

	}
	
	override function componentWillUpdate(nextProps : PersonListProps, nextState : PersonListState) : Void {

		trace('componentWillUpdate $state == $nextState ?');
	}

	override function componentDidUpdate(prevProps : PersonListProps, prevState : PersonListState) : Void {

		trace('componentDidUpdate $prevState == $state ?');
	}

	override function render() { trace('render $state');

		return jsx('
			<div>
				{ renderInput() }
				{ renderList() }
			</div>
		');
	}
}

typedef PersonItemProps = {
	name : String,
	onDelete : Void -> Void
}

class PersonItem extends ReactComponentOf<PersonItemProps, Dynamic, Dynamic> {

	public function new(p : PersonItemProps) {

		super(p);

		this.state = { color: "black" };
	}

	var timer : haxe.Timer;

	function getRandomColor() : String {

	    var letters : String = '0123456789ABCDEF';
	    var color : String = '#';
	    
	    for (i in 0...6) {

	    	color += letters.charAt(Math.floor(Math.random() * 16));
	    }
	    return color;
	}

	override function componentWillMount() : Void {

		trace("componentWillMount");
	}

	override function componentDidMount() : Void {

		trace("componentDidMount");

		timer = new haxe.Timer(1000);

		timer.run =

			function() {

				setState({ color: getRandomColor() });
			}
	}

	override function componentWillUnmount() : Void {

		trace("componentWillUnmount");

		timer.stop();
	}

	override function render() {

		return jsx('
			<div style={ state }>
				<span>{props.name}</span>
				<button onClick={props.onDelete}>X</button>
			</div>
		');
	}
}