import React from 'react';

class VibratePage extends React.Component {

	vibrate() {

		console.log("vibrate");

"#if TARGET == 'cordova'";

		navigator.vibrate(1000);

"#else";

		alert("vibrate feature available in Cordova only");
		console.log("vibrate feature available in Cordova only");

"#endif";
	}

	render() {
		return (
			<div>
				<h1>Vibration mobile feature</h1>
				<button onClick={(e) => this.vibrate()}>ENABLE</button>
			</div>
		);
	}
}

export default VibratePage;