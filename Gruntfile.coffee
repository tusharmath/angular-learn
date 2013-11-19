	matchdep = require 'matchdep'
		
	module.exports = (grunt) ->	
		matchdep.filter('grunt-*').forEach (task)-> grunt.loadNpmTasks(task)

		grunt_config = 
			opt: output: './bin'
			pkg: grunt.file.readJSON 'package.json'
			release: 
				options: npm: false

			'gh-pages':
				release:
					options: base: "<%= opt.output%>"
					src: "**"

			jade:
				compile:
					options: data: 
						debug: false, version: "<%= pkg.version%>"
					files: [
						"<%= opt.output%>/index.html" : "./views/index.jade"
					]
			coffee:
				compile:
					options: join: true
					
					files: {
						'app/app.min.js': [
							'app/app.coffee'
							'app/services/*.coffee'
							'app/controllers/*.coffee'
							'app/filters/*.coffee'
						]
					}
			uglify: compile: files:
				"<%= opt.output%>/script-<%= pkg.version%>.js":[
					'app/library/*.js'
					'app/app.min.js'
				]

			less: 
				compile:
					options: 
						strictImports: true
						compress: true

					files: 
						"<%= opt.output%>/style-<%= pkg.version%>.css" : "app/styles/less/style.less"
				
		grunt.initConfig grunt_config
		grunt.registerTask 'publish', ['release', 'jade', 'less', 'coffee', 'uglify', 'gh-pages']