import React from 'react';
import { withRouter } from 'react-router';

import styles from '../../../app/styles/component/footer.css';

var Footer = (props) => 

	<div className={ styles.root }>
		<button onClick={ (e) => props.router.goBack() }>Back</button>
	</div>

Footer = withRouter(Footer)

export default Footer;