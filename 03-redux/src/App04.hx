package ;

import api.react.ReactComponent;
import api.react.ReactMacro.jsx;
import api.react.ReactDOM;

import api.react.addon.ReactRedux;

// Dtos and models

typedef TodoItem = {
	name : String,
	personId : String,
	? completed : Bool
}

typedef Person = {
	id : String,
	name : String
}

typedef State = {
	todos : Array<TodoItem>,
	persons : Array<Person>
}

// init store logic

class InitStore {

	static public function execute() : Dynamic {

		return js.npm.Redux.createStore(

				js.npm.Redux.combineReducers(

					{
						todos: TodosRdcr.execute,
						persons: PersonsRdcr.execute
					}
				)
			);
	}
}



// Root App

class App04 {

	static function main() {

		new App04();
	}

	var store : Dynamic;

	function new() {

		store = InitStore.execute();

		renderApp();
	}

	function renderApp() {

		Application.init(js.Browser.document.querySelector("#root"), store);
	}
}

// Actions

@:enum
abstract TodosActionType(String) from String to String {
	var AddTodo = "ADD_TODO";
	var ToggleComplete = "TOGGLE_COMPLETE";
}
@:enum
abstract PersonActionType(String) from String to String {
	var AddPerson = "ADD_PERSON";
}

// Reducers (one file by rdcr)

class TodosRdcr {

	static function getDefaultState() : Array<TodoItem> {

		return [];
	}

	static public function execute(state : Array<TodoItem>, action : Dynamic) : Array<TodoItem> { trace('TodosRdcr $state $action');

		if (state == null) state = getDefaultState();

		switch (action.type) {

			case TodosActionType.AddTodo:

				state = state.concat([action.item]);

			case TodosActionType.ToggleComplete:

				state = 

					state.map(

						function(tdi : TodoItem){

							if (tdi == action.item)

								tdi.completed = (tdi.completed == null) ? true : !tdi.completed;

							return tdi;
						});
		}

		return state;
	}

	static public function getVisibleTodos(todos : Array<TodoItem>, filter : FilterType) : Array<TodoItem> {

		return todos.filter(

				function(tdi : TodoItem) {

					switch(filter) {

						case SeeAll: return true;
						case SeeCompleted: return tdi.completed;
						case SeeTodo: return !tdi.completed;
					}
					return true;
				}
			);
	}
}

class PersonsRdcr {

	static function getDefaultState() : Array<Person> {

		return [  { id: "1", name: "Alex" }, { id: "2", name: "Jeff" }, { id: "3", name: "Thomas" } ];
	}

	static public function execute(state : Array<Person>, action : Dynamic) : Array<Person> { trace('PersonsRdcr $state $action');

		if (state == null) state = getDefaultState();

		switch (action.type) {

			case PersonActionType.AddPerson:

				state = state.concat([action.person]);

		}

		return state;
	}
}

// Views

// root view

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
    		<div>
    			<TodoList.Reduxed />
    			<PersonList.Reduxed />
    		</div>
    	');
    }
}

// other view

typedef PersonListProps = {
	? dispatch : Dynamic -> Void,
	persons : Array<Person>
}

class PersonList extends ReactComponentOf<PersonListProps, Dynamic, Dynamic> {

	static public var Reduxed = ReactRedux.connect(mapStateToProps)(PersonList);

	static function mapStateToProps(st : State, ownProps : PersonListProps) : PersonListProps {

		return {
			persons: st.persons
		}
	}

	function renderPerson(p : Person) {

		return jsx('
			<tr><td>{ p.name }</td></tr>
		');
	}

	override function render() {

		return jsx('
			<table>
				<tbody>
					{ [ for(p in props.persons) renderPerson(p) ] }
				</tbody>
			</table>
		');
	}
}

// other view

@:enum
abstract FilterType(Int) {
	var SeeAll = 1;
	var SeeCompleted = 2;
	var SeeTodo = 3;
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

	static function mapStateToProps(st : State, ownProps : TodoListProps) : TodoListProps {

		return js.Object.assign({}, ownProps, { todos: st.todos });
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

		var todisplay : Array<TodoItem> = TodosRdcr.getVisibleTodos(props.todos,state.filter);

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

// view 2

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

// view 3

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

