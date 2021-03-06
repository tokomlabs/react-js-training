module.exports = {
	entry: './src/main.js',
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
				test: /\.js$/,
				exclude: /node_modules/,
				loader: 'babel',
				query: {
					presets: ['es2015', 'react']
				}
			},
			{
				test: /\.json$/,
				exclude: /node_modules/,
				loader: 'json'
			}
		]
	}	
}