import React from 'react';
import { connect } from 'react-redux';
import { actions } from 'react-redux-form';

import MyForm from './form/MyForm';

const delay = (ms) =>
  new Promise(resolve => setTimeout(resolve, ms));

class App extends React.Component {

  onNewInput(val) {

  	console.log('user input: ', val);

    // simulate asynchrone call and validation
	if (Math.random()>0.5) {

		console.log("will fail");

	    delay(500).then(() => {

			this.props.dispatch(actions.setValidity('registration', {
				api: false
			}));
	    });
	}
  }
  
  render() {
    
    return (
      <div>
        <h1>Registration Form</h1>
        <MyForm onSubmit={(val) => this.onNewInput(val)} />
        <button>Cancel</button>
      </div>
    );
  }
}

export default connect()(App);