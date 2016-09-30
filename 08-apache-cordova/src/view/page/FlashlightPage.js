import React from 'react';

class FlashlightPage extends React.Component {

	componentWillUnmount() {
		
		console.log("componentWillUnmount");

"#if TARGET == 'cordova'";

		window.plugins.flashlight.available(function(isAvailable) {
		  
			if (isAvailable && window.plugins.flashlight.isSwitchedOn()) {

				// switch off
			    window.plugins.flashlight.switchOff(
			    	
			    	function() { console.log('switch off OK'); },
			    	
			    	function() { console.error('switch off ERROR'); }
			    );
			}
		});

"#endif";

	}


	flash() {

		console.log("flash");

"#if TARGET == 'cordova'";

		window.plugins.flashlight.available(function(isAvailable) {
			
			if (isAvailable) {

				window.plugins.flashlight.toggle(
					
					function() { console.log("toggle OK") },
					
					function() { console.error("toggle ERROR") },
					
					{ intensity: 0.9 }
				);

			// switch off after 3 seconds ?
			// setTimeout(function() {
			// 	window.plugins.flashlight.switchOff();
			// }, 3000);

			} else {
				
				alert("Flashlight not available on this device");
			}
		});

"#elif TARGET == 'web'";

		alert("flashlight feature available in Cordova only");
		console.log("flashlight feature available in Cordova only");

"#endif";
	}

	render() {
		return (
			<div>
				<h1>Flashlight mobile feature</h1>
				<button onClick={(e) => this.flash()}>Toggle</button>
			</div>
		);
	}
}

export default FlashlightPage;