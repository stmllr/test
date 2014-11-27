module.exports = function(grunt) {

	'use strict';

	grunt.initConfig({
		pkg: grunt.file.readJSON("package.json"),
		version: process.env.TRAVIS_BUILD_NUMBER,
		jshint: {
			all: [
				'Gruntfile.js',
				'js/*.js',
			],
			options: {
				jshintrc: '.jshintrc'
			}
		},

		sass: {
			dev: {
				options: {
					unixNewlines: true,
					style: 'expanded',
					sourcemap: false
				},
				files: {
					'css/main.css': 'scss/main.scss'
				}
			},

			deploy: {
				options: {
					style: 'compressed'
				},
				files: {
					'dist/main-<%= version %>.min.css': 'scss/main.scss'
				}
			}
		},

		concat: {
			dist: {
				src: [
					'js/vendor/lib.js',
					'js/hello.js'
				],
				dest: 'dist/main-<%= version %>.min.js'
			}
		},

		uglify: {
			anyDistFile: {
				files: {
					'dist/main-<%= version %>.min.js': ['dist/main-<%= version %>.min.js']
				}
			}
		},
	});


	grunt.loadNpmTasks('grunt-contrib-jshint');
	grunt.loadNpmTasks('grunt-contrib-concat');
	grunt.loadNpmTasks('grunt-contrib-uglify');
	grunt.loadNpmTasks('grunt-contrib-sass');

	grunt.registerTask('dev', ['jshint', 'sass:dev']);
	grunt.registerTask('build-test', ['jshint', 'concat', 'sass:deploy', 'uglify']);
	grunt.registerTask('build-production', ['jshint', 'concat', 'sass:deploy', 'uglify']);
	grunt.registerTask('default', ['jshint']);
};