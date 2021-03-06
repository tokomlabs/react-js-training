package ;

import api.react.ReactComponent;
import api.react.ReactMacro.jsx;
import api.react.ReactDOM;

import api.react.addon.ReactRedux;

typedef State = {
	todos : Array<TodoItem>
}

class App03 {

	static function main() {

		new App03();
	}

	var store : Dynamic;

	static inline function getDefaultState() : State {

		return { todos: [] };
	}

	function new() {

		store = js.npm.Redux.createStore(myReducer);

		store.subscribe(renderApp);

		renderApp();
	}

	function myReducer(state : State, action : Dynamic) { trace('myReducer $state $action');

		if (state == null) state = getDefaultState();

		switch (action.type) {

			case "ADD_TODO":

				// state = { todos: state.todos.concat([action.item]) };
				state = js.Object.assign({},state,{todos: state.todos.concat([action.item])});

			case "TOGGLE_COMPLETE":

				state = 

					{
						todos: state.todos.map(

							function(tdi : TodoItem){

								if (tdi == action.item)

									tdi.completed = (tdi.completed == null) ? true : !tdi.completed;

								return tdi;
							})
					}
		}

		return state;
	}

	function renderApp() {

		Application.init(js.Browser.document.querySelector("#root"), store);
	}
}

class Application extends ReactComponentOf<Dynamic, Dynamic, Dynamic> {

	public static function init(node : js.html.Element, store : Dynamic) : Void {

    	ReactDOM.render(

					jsx('
						<Provider store={store}>
							<Application />
						</Provider>
					'),

					node);
    }

    override function render() {

    	return jsx('
    		<TodoList.Reduxed />
    	');
    }
}

@:enum
abstract FilterType(Int) {
	var SeeAll = 1;
	var SeeCompleted = 2;
	var SeeTodo = 3;
}

typedef TodoItem = {
	name : String,
	? completed : Bool
}

typedef TodoListProps = {
	? todos : Array<TodoItem>,
	? dispatch : Dynamic -> Void
}

typedef TodoListState = {
	? filter : FilterType
}

class TodoList extends ReactComponentOf<TodoListProps, TodoListState, Dynamic> {

	static public var Reduxed = ReactRedux.connect(mapStateToProps)(TodoList);

	static function mapStateToProps(state : State, ownProps : TodoListProps) : TodoListProps {

		return js.Object.assign({}, ownProps, { todos: state.todos });
	}

	function new(p : TodoListProps) { // props.todos

		super(p);

		state = 

			{
				filter: SeeAll
			}
	}

	function changeFilter(f : FilterType) {

		setState({ filter: f });
	}

	function toggleComplete(td : TodoItem) {

		props.dispatch({ type: "TOGGLE_COMPLETE", item: td });
	}

	function renderTodo(td : TodoItem) {

		var style : Dynamic = {};

		if (td.completed) style = { textDecoration: "line-through" };

		return jsx('
			<tr onClick={ function(){ toggleComplete(td); } }>
				<td style={style}>{ td.name }</td>
			</tr>
		');
	}

	function renderHeader() {

		var t : String = null;

		switch(state.filter) {

			case SeeAll: t = "All";
			case SeeCompleted: t = "Completed";
			case SeeTodo: t = "Todos";
		}

		return jsx('
			<h3>{ t }</h3>
		');
	}

	function renderTodos() {

		if (props.todos.length == 0) return jsx('<span>No registered Todo</span>');

		var todisplay : Array<TodoItem> =

			props.todos.filter(

				function(tdi : TodoItem) {

					switch(state.filter) {

						case SeeAll: return true;
						case SeeCompleted: return tdi.completed;
						case SeeTodo: return !tdi.completed;
					}
					return true;
				}
			);

		return jsx('
			<table>
				<tbody>
					{ [ for(td in todisplay) renderTodo(td) ] }
				</tbody>
			</table>
		');
	}

	override function render() {

		return jsx('
			<div>
				<TodoInput.Reduxed />
				{ renderHeader() }
				{ renderTodos() }
				<TodoFilters onChange={changeFilter} />
			</div>
		');
	}
}

typedef TodoInputRefs = {
	mi : js.html.InputElement
}

typedef TodoInputProps = {
	? dispatch : Dynamic -> Void
}

class TodoInput extends ReactComponentOf<TodoInputProps, Dynamic, TodoInputRefs> {

	static public var Reduxed = ReactRedux.connect()(TodoInput);

	function submit() {

		// this.props.onSubmitTodo({ name: this.refs.mi.value });

		props.dispatch({ type: "ADD_TODO", item: { name: this.refs.mi.value } });
	}

	override function render() {

		return jsx('
			<div>
				<input type="text" ref="mi" />
				<button onClick={ submit }>OK</button>
			</div>
		');
	}
}

typedef TodoFiltersProps = {
	onChange : FilterType -> Void
}

class TodoFilters extends ReactComponentOf<TodoFiltersProps, Dynamic, Dynamic> {

	override function render() {

		return jsx('
			<div>
				<button onClick={ function(){ props.onChange(SeeAll); } }>ALL</button>
				<button onClick={ function(){ props.onChange(SeeCompleted); } }>COMPLETED</button>
				<button onClick={ function(){ props.onChange(SeeTodo); } }>TODO</button>
			</div>
		');
	}
}

