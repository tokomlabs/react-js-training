import React from 'react';
import ReactDOM from 'react-dom';

class App01 extends React.Component {

	render() {

		// return React.createElement('h1',null,'Hello js learner!');

		// return <h1>Hello JSX learner!</h1>

		var name = "Thomas";

		return (
			<p>
				<b>Hello {name}</b>
				<button onClick={ (e) => this.manageClick() }
				<button onClick={ function(e) { this.manageClick(); } }
				<i> learner !</i>
			</p>
		)
	}
}

export default App01