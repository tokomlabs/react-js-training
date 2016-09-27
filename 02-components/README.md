# React JS Components

"With React JS, every thing is a component."

Refer to the [React API Bible](https://facebook.github.io/react/docs/top-level-api.html).


## JSX, WTF ?

[see code here](./src/app01.js)

You don't have to use JSX...

```
return React.createElement('h1',null,'Hello js learner!');
```

But maybe you'd like to :D

```
return <h1>Hello JSX learner!</h1>
```

Compare compiled JSX with JSX:
```
$ babel --presets react src.js -o dist.js --watch
```


## Class components vs function components

[see code here](./src/app02.js)

```
import React from 'react';

class App extends React.Component {

	render() {

		return (
			<p>
				<b>Hello</b>
				<i> learner !</i>
			</p>
		)
	}
}

export default App
```

vs

```
import React from 'react';

const App = () => <b>Hello learner!</b>

export default App
```


## Component's properties

[see code here](./src/app03.js)

Or more simply: props

* attribute like

* dynamic, configurable

* type-able



## Stateful component

[see code here](./src/app04.js)

* initialize in constructor

* update with setState, triggers a new render()



## Refs

[see code here](./src/app05.js)

* bound to DOM

* deep: this.refs.someRef.refs.someInnerRef works



## Children

[see code here](./src/app06.js)

* accessible through special prop `props.children`


## lifecycle hooks

Mounting / Unmounting:

[see code here](./src/app07.js)

* componentWillMount()
* componentDidMount()
* componentWillUnmount()

Updating: 

[see code here](./src/app08.js)

* componentWillReceiveProps(nextProps)
* componentWillUpdate(nextProps, nextState)
* componentDidUpdate(prevProps, prevState)


## Performance optimization on a component

[see code here](./src/app09.js)

* shouldComponentUpdate(nextProps, nextState)


## Patterns

* HOC

[see code here](./src/app10.js)

* Composable components

[see code here](./src/app11.js)

* Dynamically generated components

[see code here](./src/app12.js)

* Container - View

[see code here](./src/app13.js)


## To go further...

* [React Developer Tool](https://chrome.google.com/webstore/detail/react-developer-tools/fmkadmapgofadopljbjfkapdkoienihi)

* JSX live compiler

[see code here](./src/app14.js)

* CSS Modules

[see code here](./src/app15.js)

Dev:
```
$ webpack-dev-server --config webpack.config.dev-css.js --content-base app/
```

Prod:
```
$ webpack --config webpack.config.prod-css.js --content-base app/
```


