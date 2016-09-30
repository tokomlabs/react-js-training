import React from 'react';
import ReactDOM from 'react-dom';

import App from './App';

function boot() {

	console.log("booting");

	ReactDOM.render(<App />, document.getElementById("app"));
}

"#if TARGET == 'cordova'";

document.addEventListener("deviceready", onDeviceReady, false);

function onDeviceReady() {

	boot();
}

"#elif TARGET == 'web'"

boot();

"#endif";


