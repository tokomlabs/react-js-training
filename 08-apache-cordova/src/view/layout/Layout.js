import React from 'react';

import Header from '../component/Header';
import Footer from '../component/Footer';

import styles from '../../../app/styles/layout/layout.css';

const Layout = (props) => (
	<div className={styles.root}>

		<Header />
		
		<div className="content">
			{ props.children }
		</div>

		<Footer />

	</div>
)


export default Layout;