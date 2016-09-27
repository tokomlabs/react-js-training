import React from 'react';
import ReactDOM from 'react-dom';

class App04 extends React.Component {

	constructor() {

		super();

		this.state = { txt: 'this is the state txt' }
	}

	update(e) {

		this.setState({ txt: e.target.value });
	}

	render() {

		return (
			<div>
				<input type="text"
					   onChange={this.update.bind(this)} />
				<p>{this.state.txt}</p>
			</div>
		)
	}
}

export default App04