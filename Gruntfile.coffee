module.exports = (grunt) ->

	pkg = grunt.file.readJSON('package.json')
	commitMessage = grunt.option('m') || '.';
	repo = grunt.option('repo') || "dokku";

	grunt.initConfig
		coffee:
		  dist:
		    options:
		      bare:true
		      sourceMap: false
		    expand: true
		    flatten: false
		    cwd: "src"
		    src: ["**/*.coffee"]
		    dest: "dist"
		    ext: ".js"
		copy:
			dist:
				files: [
					{
						expand: true
						cwd: "src/"
						src: ["client/assets/**/*", "!client/assets/**/*.sass", "!client/assets/**/*.scss", "!client/assets/**/*.scss", "**/*.hbs", "**/*.html"]
						dest: "dist/"
					}
					{
						expand: true,
						dot: true,
						cwd: 'dist',
						dest: 'dist/',
						src: [ '**/vendor/**/*.css'],
						rename: (dest, src) ->
							path = require "path"
							basename = path.basename(src)
							return dest + src.replace(basename, "_" + basename).replace('.css','.scss')
					}
				]
		sass:
			dist:
				options:
					sourcemap: "none"
				files: [
					{
						expand: true
						cwd: "src/"
						src: ["**/*.sass"]
						dest: "dist/"
						ext: ".css"
					}
				]
		autoprefixer:
			sass:
				expand: true
				flatten: false
				src: ["dist/**/*.css", "!dist/**/vendor/**/*.css"]
		cssmin:
			sass:
				files: [
					expand: true
					cwd: "dist"
					src: ["**/*.css", "!**/vendor/**/*.css"]
					dest: "dist"
				]
		clean:
			dist: ["dist/"]
			sass: [".sass-cache"]
		bower:
	      install:
	        options:
	          install: true
	          copy: true
	          cleanBowerDir: true
	          cleanTargetDir: true
	          targetDir: "dist/client/vendor/components"
	          bowerOptions:
	            production: false
		browserify:
			app:
				files:
					'dist/client/build/app.js': ["dist/client/**/*.js", "!dist/client/build/app.js"]
		foreman:
			dev:
				env: ["dev.env"]
				procfile: "Procfile"
				port: 8080
		shell:
			push:
				command: () ->
					"git add .; git commit -m '" + commitMessage + "';git push " + repo + " master"
			killForeman:
				command: () ->
					"lsof -P | grep ':8080' | awk '{print $2}' | xargs kill -9"
		uglify:
			app:
				files:
					'dist/client/build/app.js': ["dist/client/build/app.js"]
		ngAnnotate:
			app:
				files: [
					{
						expand: true
						src: ["dist/client/**/*.js", "!dist/client/build/app.js"]
					}
				]

	grunt.loadNpmTasks 'grunt-contrib-coffee'
	grunt.loadNpmTasks 'grunt-contrib-sass'
	grunt.loadNpmTasks 'grunt-contrib-copy'
	grunt.loadNpmTasks 'grunt-contrib-clean'
	grunt.loadNpmTasks 'grunt-contrib-uglify'
	grunt.loadNpmTasks 'grunt-autoprefixer'
	grunt.loadNpmTasks 'grunt-contrib-cssmin'
	grunt.loadNpmTasks 'grunt-bower-task'
	grunt.loadNpmTasks 'grunt-browserify'
	grunt.loadNpmTasks 'grunt-shell'
	grunt.loadNpmTasks 'grunt-foreman'
	grunt.loadNpmTasks 'grunt-ng-annotate'

	grunt.registerTask 'initialize', ["clean:dist", "coffee", "bower", "copy", "ngAnnotate", "browserify", "uglify", "sass", "clean:sass", "autoprefixer", "cssmin"]
	grunt.registerTask 'update', ["coffee", "copy", "ngAnnotate", "browserify", "sass", "clean:sass", "autoprefixer"]

	grunt.registerTask 'serve', ["update", "foreman"]

	grunt.registerTask 'push', ["shell:push"]

	grunt.registerTask 'dokku:production', ["initialize"]