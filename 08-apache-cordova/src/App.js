import React from 'react';

import Layout from './view/layout/Layout';
import MenuPage from './view/page/MenuPage';
import VibratePage from './view/page/VibratePage';
import DevicePage from './view/page/DevicePage';
import FlashlightPage from './view/page/FlashlightPage';

import {
  Router,
  Route,
  IndexRoute,
  hashHistory
} from 'react-router';

const appRouter = 

	<Router history={ hashHistory }>
		<Route path="/" component={ Layout }>
			<IndexRoute component={ MenuPage }></IndexRoute>
			<Route path="vibrate" component={ VibratePage }></Route>
			<Route path="device" component={ DevicePage }></Route>
			<Route path="flash" component={ FlashlightPage }></Route>
		</Route>
	</Router>

class App extends React.Component {

	render() {

		return appRouter;
	}
}

export default App;