import React from 'react';

const DeviceInfos = () => {

	var infos = "";

"#if TARGET == 'cordova'";
	
	infos = `You are running Cordova ${device.cordova} on a ${device.manufacturer} ${device.model} under ${device.platform} ${device.version}.`;

"#elif TARGET == 'web'";
	
	infos = `Your are browsing on ${window.navigator.userAgent}`;

"#endif";

	return <div>{ infos }</div>
}

class DevicePage extends React.Component {

	render() {

		return (
			<div>
				<h1>Device informations</h1>
				<DeviceInfos />
			</div>
		);
	}
}

export default DevicePage;