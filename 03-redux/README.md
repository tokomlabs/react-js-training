# Redux

What is Redux?

Redux is a state management system.

It is not the only one. See also:
- [Flux](https://github.com/facebook/flux)
- [MobX](https://github.com/mobxjs)
- ...
- any home made MVC you could implement..


## Redux rules

* The Redux state of an application is a single READONLY javascript object.

* The Redux state of an application can be changed only by dispatching actions.

* An action is a simple js object that must have a `type` field of type string. It can have other field as a payload. Actions do not describe how the state has to be changed.

* The changes to apply to the state are done by reducers. Reducers are pure functions that take the previous state and the action as arguments and return the new state.


## Run the test case

```
$ npm install
$ babel --presets react src/app01.js -o app/index01.js
$ http-server app -p 8888
```


## Important Redux notions:

* A Redux store is created with `var store = Redux.createStore(myReducers)`

* The most important methods of a store are:
```
store.getState(); // get the current State

store.dispatch({ type: "MY_ACTION" }); // dispatches an action to the reducers

store.subscribe( () => { /* TODO refresh UI */ } ); // add a subscriber to the store changes
```

* The Reducers have to be pure functions. No mutations must be applyied to current state fields (arrays, ...) within Reducers. 

  Use of [Object.assign](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/assign) is highly recommended.

  => use polyfill in some browsers

  Or use ES6 `...` spread operator



# React Redux

Now how to inject the Redux store conviniently in a React application ?

=> [React Redux](https://github.com/reactjs/react-redux)

* create a container component with ReactRedux.connect() // HOC pattern

```
npm install --save react-redux
```


## Run the test case

[see code here](./src/app02.js)

```
$ npm install
$ babel --presets react --plugins transform-object-rest-spread src/app02.js -o app/index02.js
$ http-server app -p 8888
```


