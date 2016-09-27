import React from 'react';
import ReactDOM from 'react-dom';

class App07 extends React.Component {

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

		console.log("this.state.red + this.state.blue + this.state.green == "+(this.state.red + this.state.blue + this.state.green));
		
		if (this.state.red + this.state.blue + this.state.green >= 500 ) {

			return <div>Game over !</div>
		}

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

	constructor() {

		super();

		this.increment = this.increment.bind(this);
	}

	componentWillMount(){

    	console.log('mounting')
	}

	increment() {

		this.refs.inp.value = parseInt(this.refs.inp.value) + 5;

		this.props.update();
	}

	componentDidMount(){

		console.log('mounted');

		this.timer = setInterval(this.increment,500);
	}

	componentWillUnmount(){

		clearInterval(this.timer);

		console.log('unmounted')
	}

	render() {

		return (
			<input type="range"
				   min="0"
				   max="255"
				   ref="inp"
				   onChange={this.props.update} />
		)
	}
}

export default App07