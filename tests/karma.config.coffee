module.exports = (config) ->
	config.set
		basePath: '../'
		frameworks: ['mocha', 'chai']
		preprocessors:
			'**/*.coffee': ['coffee']
		files: [
			'app/library/angular.js'
			'tests/angular-mocks.js'
			'app/app.coffee'
			'app/services/*.coffee'
			'tests/test.*.coffee'
		]
		autoWatch: true
		browsers: ['Chrome']
		plugins: ['karma-mocha','karma-chrome-launcher', 'karma-coffee-preprocessor', 'karma-chai']
