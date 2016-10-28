module.exports = {
	entry: './.tmp/main.js',
	output: {
		path: './app',
		filename: 'index.js'
	},
	devServer: {
		inline: true,
		port: 8080
	},
	module: {
		loaders: [
			{
				test: /\.json$/,
				exclude: /node_modules/,
				loader: 'json'
			}
		]
	}	
}