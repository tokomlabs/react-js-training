import React from 'react';
import ReactDOM from 'react-dom';

let Mixin = (InnerComponent) => class extends React.Component {

	constructor(){

		super();

		this.update = this.update.bind(this);

		this.state = {val: 0}
	}

	update(){

		this.setState({val: this.state.val + 1})
	}

	componentWillMount(){

		console.log('will mount')
	}

	render(){

		return (
			<InnerComponent update={this.update}
		    				{...this.state}
		    				{...this.props} />
		)
	}

	componentDidMount(){

		console.log('mounted')
	}
}

const MyButton = (props) => <button onClick={props.update}>
								{props.text} - {props.val}
							</button>

const MyLabel = (props) => <label onMouseOver={props.update}>
								{props.text} - {props.val}
							</label>

let MixedButton = Mixin(MyButton);

let MixedLabel = Mixin(MyLabel);

class App10 extends React.Component {

	render() {

		return (
			<div>
				<MixedButton text="Click me" />
				<br/>
				<MixedLabel text="Mouse over me" />
			</div>
		)
	}
}

export default App10