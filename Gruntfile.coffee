	matchdep = require 'matchdep'
		
	module.exports = (grunt) ->	
		matchdep.filterAll('grunt-*').forEach (task)-> grunt.loadNpmTasks(task)

		grunt_config = 
			opt: output: './.bin'
			pkg: grunt.file.readJSON 'package.json'
		
		
			copy: main:
				src: 'app/resources/images/*'
				dest: '<%= opt.output%>/resources/images/'
				flatten: true
				expand: true
				
			jade:
				compile:
					options: data: 
						debug: false, version: "<%= pkg.version%>"
					files: [
						"<%= opt.output%>/index.html" : "./views/index.jade"
					]

			mochaTest: test:
				options: 
					reporter: 'spec'
					require: ['coffee-script/register', 'should']
				src: ['test/*.coffee']


			clean: 
				build: ['<%= opt.output%>']
				tempJS: ['app/app.min.js']
			less: 
				compile:
					options: 
						strictImports: true
						compress: true

					files: 
						"<%= opt.output%>/resources/css/style-<%= pkg.version%>.css" : "app/resources/less/style.less"
				
		grunt.initConfig grunt_config
		grunt.registerTask 'package', [ 'clean', 'jade', 'less', 'copy']

