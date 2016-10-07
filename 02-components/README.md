# React JS Components

"In React, every thing is component."


## References

* [React API Bible](https://facebook.github.io/react/docs/top-level-api.html),

* [MDN javascript API reference](https://developer.mozilla.org/fr/docs/Web/JavaScript/Reference),

* [ES6 specifications](http://www.ecma-international.org/ecma-262/6.0/)

* [Learn ES6](https://babeljs.io/docs/learn-es2015/)

* [ES6 current native support](http://kangax.github.io/compat-table/es6/)


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

Few points:

* JSX is the ideal component markup language

* JSX will ease team work between integrators and developers

* JSX is close to HTML


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



## Component lifecycle methods

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

* Composable components

[see code here](./src/app10.js)

* Dynamically generated components

[see code here](./src/app11.js)

* HOC - Higher Order Component

[see code here](./src/app12.js)

* Container - View

[see code here](./src/app13.js)

The View (or Presentational) component know how to render the view. It's concerned about how things look.

The Container component knows how to behave with the rest of the app. It's concerned about how things go.

A good example of presentational components is [MaterialUI](material-ui.com).



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


