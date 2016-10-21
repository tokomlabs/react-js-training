module.exports = {
	entry: './.tmp/main.js',
	output: {
		path: './app',
		filename: 'index01-hx.js'
	},
	devServer: {
		inline: true,
		port: 8080
	},
	module: {}	
}