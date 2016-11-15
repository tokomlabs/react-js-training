var CommonsChunkPlugin = new require("webpack/lib/optimize/CommonsChunkPlugin")

module.exports = {
	entry: {
        index: "./.tmp/index.js",
        app01: "./.tmp/app01.js",
        app02: "./.tmp/app02.js"
    },
	output: {
		path: './app',
		filename: '[name].js',
		chunkFilename: '[name].chunk.js'
	},
	devServer: {
		inline: true,
		port: 8080
	},
	plugins: [
		new CommonsChunkPlugin('common.js')
	],
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