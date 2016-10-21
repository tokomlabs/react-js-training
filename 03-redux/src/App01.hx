package ;

import api.react.ReactComponent;
import api.react.ReactMacro.jsx;
import api.react.ReactDOM;

class App01 {

	static function main() {

		ReactDOM.render(
					
			jsx('
				<TodoList />
			'),

			js.Browser.document.querySelector("#root"));
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

typedef TodoListState = {
	? todos : Array<TodoItem>,
	? filter : FilterType
}

class TodoList extends ReactComponentOf<Dynamic, TodoListState, Dynamic> {

	function new(p : Dynamic) {

		super(p);

		state = 

			{
				todos: [],
				filter: SeeAll
			}
	}

	function changeFilter(f : FilterType) {

		setState({ filter: f });
	}

	function toggleComplete(td : TodoItem) {

		setState(
			{
				todos: state.todos.map(

					function(tdi : TodoItem){

						if (tdi == td)

							tdi.completed = (tdi.completed == null) ? true : !tdi.completed;

						return tdi;
					})
			}
		);
	}

	function onSubmitTodo(td : TodoItem) {

		setState({ todos: state.todos.concat([td]) });
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

		if (state.todos.length == 0) return jsx('<span>No registered Todo</span>');

		var todisplay : Array<TodoItem> =

			state.todos.filter(

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
				<TodoInput onSubmitTodo={onSubmitTodo} />
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
	onSubmitTodo : TodoItem -> Void
}

class TodoInput extends ReactComponentOf<TodoInputProps, Dynamic, TodoInputRefs> {

	function submit() {

		this.props.onSubmitTodo({ name: this.refs.mi.value });
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

