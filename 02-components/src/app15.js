import React from 'react';
import ReactDOM from 'react-dom';

import styles from '../app/styles/app15.css';

const url = require("../app/images/file.png");

class App extends React.Component {

	render() {

		return (
			<div className={styles.app}>
				<p>This text will be blue.</p>
				<img src={url} />
			</div>
		)
	}
}

export default App
