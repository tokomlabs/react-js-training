import React from 'react';
import ReactDOM from 'react-dom';

class App06 extends React.Component {

	render() {

		return (
			<div>
				<Widget><b>{this.props.name}</b></Widget>
			</div>
		)
	}
}

App06.propTypes = {
  name: React.PropTypes.string.isRequired
}

App06.defaultProps ={
  name: "Baby"
}

class Widget extends React.Component {

	render() {

		return (
			<button>Shake it, {this.props.children}!</button>
		)
	}
}

export default App06