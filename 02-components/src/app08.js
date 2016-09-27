import React from 'react';
import ReactDOM from 'react-dom';

class App08 extends React.Component {

	constructor(){
		
		super();

		this.update = this.update.bind(this);
		
		this.state = { val: 0 }
	}

	update() { console.log("update");

		this.setState({ val: this.state.val+1 });
	}
	
	render(){ console.log('render and val is '+this.state.val);
	
		return (
			<Widget val={this.state.val} update={this.update} />
		)
	}
}

class Widget extends React.Component {

	constructor(){
		
		super();
		
		this.state = { increasing: false }
	}

	componentWillReceiveProps(nextProps) {

		console.log('componentWillReceiveProps', nextProps);

		this.setState({increasing: nextProps.val > this.props.val})
	}

	componentDidUpdate(prevProps, prevState) {

		console.log('componentDidUpdate', prevProps)
	}

	render() {

		console.log("render");

		console.log(this.state.increasing)
	
		return (
			<button onClick={this.props.update}>
				{this.props.val}
			</button>
		)
	}
}

Widget.defaultProps = { val: 0 }

export default App08
