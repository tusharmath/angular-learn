	matchdep = require 'matchdep'
		
	module.exports = (grunt) ->	
		matchdep.filterAll('grunt-*').forEach (task)-> grunt.loadNpmTasks(task)

		grunt_config = 
			opt: output: './.bin'
			pkg: grunt.file.readJSON 'package.json'
		
			karma: unit: configFile: 'tests/karma.config.coffee'
		
			copy: main:
				src: 'app/styles/images/*'
				dest: '<%= opt.output%>/styles/images/'
				flatten: true
				expand: true
				
			

			jade:
				compile:
					options: data: 
						debug: false, version: "<%= pkg.version%>"
					files: [
						"<%= opt.output%>/index.html" : "./views/index.jade"
					]
			uglify: compile: files:
				"<%= opt.output%>/script-<%= pkg.version%>.js":[
					'app/bower_components/angular/angular.js',
					'app/bower_components/angular-touch/angular-touch.js',
					'app/bower_components/lodash/dist/lodash.js',
					'app/app.min.js'
				]


			clean: 
				build: ['<%= opt.output%>']
				tempJS: ['app/app.min.js']
			less: 
				compile:
					options: 
						strictImports: true
						compress: true

					files: 
						"<%= opt.output%>/styles/css/style-<%= pkg.version%>.css" : "app/styles/less/style.less"
				
		grunt.initConfig grunt_config

