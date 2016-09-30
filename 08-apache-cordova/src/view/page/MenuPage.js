import React from 'react';

import { withRouter } from 'react-router';

import styles from '../../../app/styles/page/menu-page.css';

var MenuPage = (props) =>
	
	<div className={styles.root}>

		<div><button onClick={(e) => props.router.push('/vibrate')}>VIBRATE</button></div>
		
		<div><button onClick={(e) => props.router.push('/device')}>DEVICE</button></div>

		<div><button onClick={(e) => props.router.push('/flash')}>FLASHLIGHT</button></div>

	</div>

MenuPage = withRouter(MenuPage);

export default MenuPage;