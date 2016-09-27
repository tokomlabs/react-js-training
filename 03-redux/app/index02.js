var _extends = Object.assign || function (target) { for (var i = 1; i < arguments.length; i++) { var source = arguments[i]; for (var key in source) { if (Object.prototype.hasOwnProperty.call(source, key)) { target[key] = source[key]; } } } return target; };

/**
Reducers
**/

const todo = (state, action) => {

  switch (action.type) {

    case 'ADD_TODO':

      return {
        id: action.id,
        text: action.text,
        completed: false
      };

    case 'TOGGLE_TODO':

      if (state.id !== action.id) {

        return state;
      }

      // return {
      //   ...state,
      //   completed: !state.completed
      // };
      return Object.assign({}, state, { completed: !state.completed });

    default:

      return state;
  }
};

const todos = (state = [], action) => {

  switch (action.type) {

    case 'ADD_TODO':

      return [...state, todo(undefined, action)];

    case 'TOGGLE_TODO':

      return state.map(t => todo(t, action));

    default:
      return state;
  }
};

const visibilityFilter = (state = 'SHOW_ALL', action) => {
  switch (action.type) {
    case 'SET_VISIBILITY_FILTER':
      return action.filter;
    default:
      return state;
  }
};

const { combineReducers } = Redux;
const todoApp = combineReducers({
  todos,
  visibilityFilter
});

const { Component } = React;
const { connect } = ReactRedux;

const Link = ({
  active,
  children,
  onClick
}) => {
  if (active) {
    return React.createElement(
      'span',
      null,
      children
    );
  }

  return React.createElement(
    'a',
    { href: '#',
      onClick: e => {
        e.preventDefault();
        onClick();
      }
    },
    children
  );
};

const mapStateToLinkProps = (state, ownProps) => {
  return {
    active: ownProps.filter === state.visibilityFilter
  };
};
const mapDispatchToLinkProps = (dispatch, ownProps) => {
  return {
    onClick: () => {
      dispatch({
        type: 'SET_VISIBILITY_FILTER',
        filter: ownProps.filter
      });
    }
  };
};
const FilterLink = connect(mapStateToLinkProps, mapDispatchToLinkProps)(Link);

const Footer = () => React.createElement(
  'p',
  null,
  'Show:',
  ' ',
  React.createElement(
    FilterLink,
    { filter: 'SHOW_ALL' },
    'All'
  ),
  ', ',
  React.createElement(
    FilterLink,
    { filter: 'SHOW_ACTIVE' },
    'Active'
  ),
  ', ',
  React.createElement(
    FilterLink,
    { filter: 'SHOW_COMPLETED' },
    'Completed'
  )
);

const Todo = ({
  onClick,
  completed,
  text
}) => React.createElement(
  'li',
  {
    onClick: onClick,
    style: {
      textDecoration: completed ? 'line-through' : 'none'
    }
  },
  text
);

const TodoList = ({
  todos,
  onTodoClick
}) => React.createElement(
  'ul',
  null,
  todos.map(todo => React.createElement(Todo, _extends({
    key: todo.id
  }, todo, {
    onClick: () => onTodoClick(todo.id)
  })))
);

let nextTodoId = 0;
let AddTodo = ({ dispatch }) => {
  let input;

  return React.createElement(
    'div',
    null,
    React.createElement('input', { ref: node => {
        input = node;
      } }),
    React.createElement(
      'button',
      { onClick: () => {
          dispatch({
            type: 'ADD_TODO',
            id: nextTodoId++,
            text: input.value
          });
          input.value = '';
        } },
      'Add Todo'
    )
  );
};
AddTodo = connect()(AddTodo);

const getVisibleTodos = (todos, filter) => {
  switch (filter) {
    case 'SHOW_ALL':
      return todos;
    case 'SHOW_COMPLETED':
      return todos.filter(t => t.completed);
    case 'SHOW_ACTIVE':
      return todos.filter(t => !t.completed);
  }
};

const mapStateToTodoListProps = state => {
  return {
    todos: getVisibleTodos(state.todos, state.visibilityFilter)
  };
};
const mapDispatchToTodoListProps = dispatch => {
  return {
    onTodoClick: id => {
      dispatch({
        type: 'TOGGLE_TODO',
        id
      });
    }
  };
};
const VisibleTodoList = connect(mapStateToTodoListProps, mapDispatchToTodoListProps)(TodoList);

const TodoApp = () => React.createElement(
  'div',
  null,
  React.createElement(AddTodo, null),
  React.createElement(VisibleTodoList, null),
  React.createElement(Footer, null)
);

const { Provider } = ReactRedux;
const { createStore } = Redux;

ReactDOM.render(React.createElement(
  Provider,
  { store: createStore(todoApp) },
  React.createElement(TodoApp, null)
), document.getElementById('root'));
