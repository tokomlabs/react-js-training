# SETUP YOUR REACT JS DEV ENVIRONMENT


## What do we need and why ?

* [Node.js](https://nodejs.org/) to make use of npm

* [Babel](https://babeljs.io/) to translate ES6 and JSX code to older javascript

* [Webpack](https://webpack.github.io/) to support `require` and `import` statements

	See also:
	- [browserify](browserify.org/)
	- [JSPM](jspm.io)

* a web server, to serve our files


## Steps

1 - Create a workspace and init a npm project
```
$ npm init
```

2 - Install React and React DOM
```
$ npm install react react-dom --save
```

3 - Install Babel libs
```
$ npm install babel -g # do this only once
$ npm install babel-loader babel-core babel-preset-es2015 babel-preset-react --save-dev
```

4 - Install Webpack
```
$ npm install webpack -g
```

5 - Install a web server
```
$ npm install webpack-dev-server -g
```

6 - Configure webpack (see [webpack.config.js](./webpack.config.js))


7 - Launch the server
```
webpack-dev-server --content-base app/
```


# References

* [npm reference](https://docs.npmjs.com/)

* [Babel reference](http://babeljs.io/docs/setup/)

* [Webpack reference](https://webpack.github.io/docs/)

