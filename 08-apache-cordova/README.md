# Apache Cordova

Mobile application engine based on a WebView for rendering + plugin system for native features.


## References

* [Apache Cordova Bible](https://cordova.apache.org/docs/en/6.x/guide/overview/index.html)


## Important Cordova aspects

### The webview

* The webview is interchangeable on some systems.

  See [Crosswalk](https://github.com/crosswalk-project/cordova-plugin-crosswalk-webview) for Android.

  See [the WKWebview](https://github.com/apache/cordova-plugin-wkwebview-engine) for iOS.

  Using alternative webview on some systems can be highly recommanded.


### Cordova CLI

Do not edit / modify a cordova project without the Cordova cli.

Install the CLI:
```
sudo npm install -g cordova
```

Most commonly used commands:
```
# create a project
$ cordova create hello com.example.hello HelloWorld

# add platforms
$ cordova platform add ios --save
$ cordova platform add android --save

# list current platforms
$ cordova platform list

# install a plugin
$ cordova plugin add cordova-plugin-camera

# list currently installed plugins
$ cordova plugin list

# run app on Android
$ cordova run android

# etc...
```

See the [Cordova CLI Bible](https://cordova.apache.org/docs/en/latest/reference/cordova-cli/index.html).


### The config.xml file

The central configuration file for your mobile app. See the [config.xml reference](https://cordova.apache.org/docs/en/latest/config_ref/index.html).

* controls the name, id, icons, splashscreens, plugin-related configurations and more,

* this file should be versioned.


### Cordova plugins

Exposes native features to your app.

See the [Cordova plugins search engine](https://cordova.apache.org/plugins/).

You can create custom plugins rather easily thanks to a normalized API. See [here for more info](https://cordova.apache.org/docs/en/latest/guide/hybrid/plugins/index.html).


### Cordova specific considerations when developping your js app

* The bootstrap html page must load the `cordova.js` script before your app script:
```
<!DOCTYPE html>
<html>
    <head>
        <title>My app</title>
    </head>
    <body>
        <div class="app">
        </div>
        <script type="text/javascript" src="cordova.js"></script>
        <script type="text/javascript" src="myapp.js"></script>
    </body>
</html>
```

* [Content Security Policy rules](<access origin="https://google.com" />) are to be implemented via the html meta.

   Controls which network requests (images, XHRs, etc) are allowed to be made (via webview directly).
```
<!-- This policy allows everything (eg CSS, AJAX, object, frame, media, etc) except that 
    * CSS only from the same origin and inline styles,
    * scripts only from the same origin and inline styles, and eval()
-->
<meta http-equiv="Content-Security-Policy" content="default-src *; style-src 'self' 'unsafe-inline'; script-src 'self' 'unsafe-inline' 'unsafe-eval'">
```

* And via [whitelisting](https://cordova.apache.org/docs/en/latest/guide/appdev/whitelist/index.html)
```
<access origin="https://google.com" />
```

* The app must bootstrap on the cordova `deviceready` event
```
document.addEventListener('deviceready', this.boot, false);
```

## Development workflow

* develop your app in your desktop browser

* once OK on desktop, test it on mobile

Debugging on mobile:

- on Android : 

  - enable usb debugging on your Android device

  - usb-plug your device to your computer, 

  - open chrome (on the computer), and go to `chrome://inspect`.

  - if your app is running and is a debug build, you'll be able to debug your app remotly.

- on iOS : 

  - enable debugging in safari settings on your iOS device

  - usb-plug your iOS device to your mac,

  - on your mac, open safari and go to Develop > *your device name* 

  - if your app is running and is a debug build, you should see it in the inspectable targets.


* compile only the code necessary for your platform. With Babel, you can use `babel-plugin-conditional-compilation`.


## Sample app

To run the sample app, follow those steps:

* Create a cordova project
```
$ cordova create cordova com.example.hello HelloWorld
```

* Install few plugins
```
$ cd cordova
$ cordova plugin add cordova-plugin-vibration
$ cordova plugin add cordova-plugin-device
$ cordova plugin add cordova-plugin-flashlight
$ cd ..
```

* Build your app to cordova
```
$ webpack --config webpack.config.cordova.js --content-base app/
```

* Run the app on Android
```
$ cd cordova
$ cordova run android
```

