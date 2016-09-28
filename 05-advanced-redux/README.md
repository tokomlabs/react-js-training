# Advanced Redux

Real world application development with Redux and React JS.

Sample application in `/src` (run with `npm start`).


## persisting the state

* the `createStore()` method allows a second argument for the initial state value

* state can be persisted in local storage

See also [`redux-localstorage`](https://github.com/elgerlambert/redux-localstorage)

* don't store routing state in Redux


## Best practices

* put the store logic creation in one place

* use action creators from react components and organize them in separate files

* use selectors to map state to props in components

* collocate selectors with reducers based on what part of the state they are aware of

* one state field => one reducer (can be result of combineReducers) + (0+) selectors

* normalize the state shape (object by id, ...). See also [Normalizr](https://github.com/paularmstrong/normalizr).


## Asynchronous actions dispatch

See [redux-thunk](https://github.com/gaearon/redux-thunk)

Redux Thunk is a Redux middleware that allows you to dispatch a "thunk" (asynchronous action creator).

Redux middlewares can be applyied at store creation (third argument of the `createStore()` function).

Redux middlewares are little libs that customize Redux behavior (for example the `dispatch()` method).

Many redux middlewares are available out there. See [Redux logger](https://github.com/evgenyrodionov/redux-logger), [Redux promise](https://github.com/acdlite/redux-promise), etc...


## Sample

```
$ npm install
$ npm start

```

