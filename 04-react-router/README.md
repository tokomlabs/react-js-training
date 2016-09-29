# React Router

* [React Router Bible](https://github.com/ReactTraining/react-router/blob/master/docs/API.md)

* Comes in with different React components: Router, Route, Link

* Supports different history systems: browserHistory, hashHistory, memoryHistory or any custom histories

* Route components can be nested

* Redirect routes can be defined with the RedirectRoute component

* Indexes are managed with the IndexRoute and IndexRedirect components

* Dynamic url parameters are prefixed with `:` and optional portions of a route url are between `()`

* Setting route leave hooks is possible with `router.setLeaveHook()` method

* Page animations can be added with components like [react-addons-css-transition-group](https://github.com/facebook/react/blob/master/src/addons/transitions/ReactCSSTransitionGroup.js)

* A component can be "Router aware" with the HOC function `withRouter()`

## Run sample

```
npm install
npm start
```