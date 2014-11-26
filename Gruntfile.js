module.exports = function(grunt) {
 
	grunt.initConfig({
		pkg: grunt.file.readJSON("package.json"),
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
					style: 'expanded'
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
					'dist/main-<%= pkg.version %>.min.css': 'scss/main.scss'
				}
			}
		},

		concat: {
			dist: {
				src: [
					'js/vendor/lib.js',
					'js/hello.js'
				],
				dest: 'dist/main-<%= pkg.version %>.min.js'
			}
		},

		uglify: {
			anyDistFile: {
				files: {
					'dist/main-<%= pkg.version %>.min.js': ['dist/main-<%= pkg.version %>.min.js']
				}
			}
		},
	});


	grunt.loadNpmTasks('grunt-contrib-jshint');
	grunt.loadNpmTasks('grunt-contrib-concat');
	grunt.loadNpmTasks('grunt-contrib-uglify');
	grunt.loadNpmTasks('grunt-contrib-sass'); 

	grunt.registerTask('dev', ['jshint', 'sass:dev']);
	grunt.registerTask('acceptance', ['jshint', 'concat', 'sass:deploy', 'uglify']);
	grunt.registerTask('production', ['jshint', 'concat', 'sass:deploy', 'uglify']);
 
};