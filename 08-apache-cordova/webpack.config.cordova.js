var ExtractTextPlugin = require('extract-text-webpack-plugin');

module.exports = {
	entry: './src/main.js',
	output: {
		path: './cordova/www',
		filename: 'index.js'
	},
	module: {
		loaders: [
			{
				test: /\.js$/,
				exclude: /node_modules/,
				loader: 'babel',
				query: {
					presets: ['es2015', 'react'],
					plugins: [ ["conditional-compilation", { TARGET: "cordova" }] ]
				}
			},
			{
				test: /\.css$/,
				loader: ExtractTextPlugin.extract(
					'style-loader',
					'css-loader?modules=true&localIdentName=[name]__[local]___[hash:base64:5]'
				)
			},
			{
                test: /\.html$/,
                loader: 'file-loader?name=[name].[ext]',
            },
            {
            	test: /\.(jpe?g|png|gif|svg)$/i,
            	loader: "file-loader?name=images/[name].[ext]"
            }
		]
	},
	plugins: [
		new ExtractTextPlugin('styles/app.css')
	]
}