# Haxe & React JS - Code splitting

## References

* [Code splitting with Webpack](https://webpack.github.io/docs/code-splitting.html),

* [Code splitting a Haxe JS application](https://github.com/elsassph/modular-haxe-example),

* [Code splitting a React Router application](https://github.com/ReactTraining/react-router/blob/master/docs/guides/DynamicRouting.md),

* [Code splitting a React Redux application](https://github.com/reactjs/redux/blob/master/docs/api/Store.md#replacereducernextreducer),

* [Multiple Intl contexts a React Intl application](https://github.com/yahoo/react-intl/wiki/Components#multiple-intl-contexts).


## Installation

```
npm install react react-dom react-router webpack --save
```

## Important code splitting notions

### Webpack

Here, we'll use webpack to manage the common dependencies of our modules (ie: `react-router`, `react-intl`, etc...). To do so, we needs two things:

* webpack all our modules at once with [several entry points](https://webpack.github.io/docs/multiple-entry-points.html),

* configure webpack to use the [Common Chunk plugin](https://webpack.github.io/docs/list-of-plugins.html#commonschunkplugin) that will put all common dependencies in a separate js file (`common.js`).

Everywhere we will have a `require()` statement in our haxe generated JS code, webpack will manage those dependencies wisely throughout all our (custom/own) modules.


### Haxe JS

We will need two little lib classes that have not yet made it to haxelib at the time I'm writing it. Those two libs can be found [there](https://github.com/elsassph/modular-haxe-example/tree/master/lib).

* hx-lib/Require.hx: lets you import a haxe module and merges its scope within the current scope so that classes from the module can be instantiated from the main module and vice versa.

* hx-lib/Stub.hx: macro that "hacks" the haxe JS output to allow scope merging.

Take a look at the [limitations / gotchas](https://github.com/elsassph/modular-haxe-example#gotchas) before using it.


### React Router

React router lets us define our routes asynchronously and on demand. To do so, we will declare our router and its route with different parameters than usually:

* [getComponent](https://github.com/ReactTraining/react-router/blob/master/docs/API.md#getcomponentnextstate-callback) instead of `component` to get a route component from a module to load,

* [getChildRoutes](https://github.com/ReactTraining/react-router/blob/master/docs/API.md#getchildroutespartialnextstate-callback) to specify an array of child routes from the module's component,

* [getIndexRoute](https://github.com/ReactTraining/react-router/blob/master/docs/API.md#getindexroutepartialnextstate-callback) to specify the index route of the module's component.

This mecanism can be used at any Route depth and as many time as needed.


### React Redux

The only thing we really need here is just a mecanism to update our store's registered reducers. To do so, use the [`replaceReducer()` store API](https://github.com/reactjs/redux/blob/master/docs/api/Store.md#replacereducernextreducer) every time a new module is loaded.


### React Intl

