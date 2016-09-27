var _extends = Object.assign || function (target) { for (var i = 1; i < arguments.length; i++) { var source = arguments[i]; for (var key in source) { if (Object.prototype.hasOwnProperty.call(source, key)) { target[key] = source[key]; } } } return target; };

/*
 * We will be explaining the code below
 * in the following lessons. For now,
 * feel free to click around and notice
 * how the dispatched action is logged
 * to the console on every change.
 */

const ADD_TODO = 'ADD_TODO';
const TOGGLE_TODO = 'TOGGLE_TODO';
const SET_VISIBILITY_FILTER = 'SET_VISIBILITY_FILTER';

const Filters = {
  SHOW_ALL: 'SHOW_ALL',
  SHOW_COMPLETED: 'SHOW_COMPLETED',
  SHOW_ACTIVE: 'SHOW_ACTIVE'
};

/*
 * Components
 */

class AddTodo extends React.Component {

  render() {

    return React.createElement(
      'div',
      null,
      React.createElement('input', { type: 'text', ref: 'input' }),
      React.createElement(
        'button',
        { onClick: e => this.handleClick(e) },
        'Add'
      )
    );
  }

  handleClick(e) {
    const node = this.refs.input;
    const text = node.value.trim();
    this.props.onAddClick(text);
    node.value = '';
  }
}

const FilterLink = ({ isActive, name, onClick }) => {
  if (isActive) {
    return React.createElement(
      'span',
      null,
      name
    );
  }

  return React.createElement(
    'a',
    { href: '#', onClick: e => {
        e.preventDefault();onClick();
      } },
    name
  );
};

const Footer = ({ filter, onFilterChange }) => React.createElement(
  'p',
  null,
  'Show:',
  ' ',
  React.createElement(FilterLink, {
    name: 'All',
    isActive: filter === Filters.SHOW_ALL,
    onClick: () => onFilterChange(Filters.SHOW_ALL) }),
  ', ',
  React.createElement(FilterLink, {
    name: 'Completed',
    isActive: filter === Filters.SHOW_COMPLETED,
    onClick: () => onFilterChange(Filters.SHOW_COMPLETED) }),
  ', ',
  React.createElement(FilterLink, {
    name: 'Active',
    isActive: filter === Filters.SHOW_ACTIVE,
    onClick: () => onFilterChange(Filters.SHOW_ACTIVE) })
);

const Todo = ({ onClick, completed, text }) => React.createElement(
  'li',
  {
    onClick: onClick,
    style: {
      textDecoration: completed ? 'line-through' : 'none',
      cursor: 'pointer'
    } },
  text
);

const TodoList = ({ todos, onTodoClick }) => React.createElement(
  'ul',
  null,
  todos.map(todo => React.createElement(Todo, _extends({}, todo, {
    key: todo.id,
    onClick: () => onTodoClick(todo.id) })))
);

let nextTodoId = 0;
const TodoApp = ({ dispatch, todos, visibilityFilter }) => {
  let visibleTodos = todos;

  switch (visibilityFilter) {
    case Filters.SHOW_COMPLETED:
      visibleTodos = todos.filter(todo => todo.completed);
      break;
    case Filters.SHOW_ACTIVE:
      visibleTodos = todos.filter(todo => !todo.completed);
      break;
  }

  return React.createElement(
    'div',
    null,
    React.createElement(AddTodo, {
      onAddClick: text => dispatch({ type: ADD_TODO, text, id: nextTodoId++ }) }),
    React.createElement(TodoList, {
      todos: visibleTodos,
      onTodoClick: id => dispatch({ type: TOGGLE_TODO, id }) }),
    React.createElement(Footer, {
      filter: visibilityFilter,
      onFilterChange: filter => dispatch({ type: SET_VISIBILITY_FILTER, filter }) })
  );
};

/*
 * Reducers
 */

const visibilityFilter = (state = Filters.SHOW_ALL, action) => {
  switch (action.type) {
    case SET_VISIBILITY_FILTER:
      return action.filter;
    default:
      return state;
  }
};

const todos = (state = [], action) => {
  switch (action.type) {
    case ADD_TODO:
      return [...state, {
        text: action.text,
        id: action.id,
        completed: false
      }];
    case TOGGLE_TODO:
      return state.map(todo => todo.id === action.id ? Object.assign({}, todo, { completed: !todo.completed }) : todo);
    default:
      return state;
  }
};

const todoApp = Redux.combineReducers({
  visibilityFilter,
  todos
});

/*
 * Go!
 */

const store = Redux.createStore(todoApp);
const dispatch = action => {
  console.log('----------------');
  console.log('dispatching action:');
  console.log(action);
  store.dispatch(action);
};
const render = () => {
  ReactDOM.render(React.createElement(TodoApp, _extends({}, store.getState(), {
    dispatch: dispatch
  })), document.getElementById('root'));
};
render();
store.subscribe(render);
// noprotect
