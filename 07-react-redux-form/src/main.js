import React from 'react';
import ReactDOM from 'react-dom';
import { createStore, applyMiddleware } from 'redux';
import { Provider } from 'react-redux';
import thunk from 'redux-thunk';
import { combineForms } from 'react-redux-form';
import App from './App';

const initialRegistration = { 
  firstName: '',
  lastName: '',
  email: '',
  pass: '',
  confirmPass: '',
};

const store = createStore(
	combineForms({
		registration: initialRegistration,
	}),
    applyMiddleware(thunk)
);

ReactDOM.render(<Provider store={ store }><App /></Provider>, document.getElementById('app'));