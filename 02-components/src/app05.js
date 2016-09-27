import React from 'react';
import ReactDOM from 'react-dom';

class App05 extends React.Component {

	constructor() {

		super();
		
		this.state = 

			{
				red: 0,
				blue: 0,
				green: 0
			}

		this.update = this.update.bind(this);
	}

	update(e) {

		this.setState(
			{
				red: parseInt(ReactDOM.findDOMNode(this.refs.red).value),
				blue: parseInt(ReactDOM.findDOMNode(this.refs.blue).value),
				green: parseInt(ReactDOM.findDOMNode(this.refs.green).value)
			}
		);
	}

	render() {

		return (
			<div>
				<Widget update={this.update} ref="red" />
				<p>{this.state.red}</p>
				<br />
				<Widget update={this.update} ref="blue" />
				<p>{this.state.blue}</p>
				<br />
				<Widget update={this.update} ref="green" />
				<p>{this.state.green}</p>
				<br />
			</div>
		)
	}
}

class Widget extends React.Component {

	render() {

		return (
			<input type="range"
				   min="0"
				   max="255"
				   onChange={this.props.update} />
		)
	}
}

export default App05