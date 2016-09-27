import React from 'react';
import ReactDOM from 'react-dom';

class App03 extends React.Component {

	render() {

		return (
			<div>
				<h1>Hello {this.props.name}!</h1>
				<p>Your have {this.props.count} unread messages.</p>
			</div>
		)
	}
}

App03.propTypes = {
  count: React.PropTypes.number,
  name: React.PropTypes.string.isRequired
}

App03.defaultProps ={
  count: 2
}

export default App03