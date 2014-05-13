module.exports = function(grunt) {
    grunt.initConfig({
        pkg: grunt.file.readJSON('package.json'),
        sass: {
            options: {
                includePaths: ['bower_components/foundation/scss']
            },
            dev: {
                files: {
                    'dev/css/style.css': 'front_end/sass/style.sass'
                }
            }
        },
        copy: {
            main: {
                files: [
                    {cwd: 'front_end/', expand: true, src: ['*.html', 'libs/**', 'res/**', 'css/**'], dest: 'dev/'},
                    {cwd: 'api', expand: true, src: ['**'], dest: 'dev/api', dot: true},
                    {cwd: 'bower_components', expand: true, src: ['**'], dest: 'dev/bower_components'}
                ],
                nonull: true
            }
        },
        
        coffee: {
            main: {
                files: {
                    'dev/js/app.js': ['front_end/coffee/**/*.coffee']
                }
            }
        },

        watch: {
            css: {
                files: ['front_end/sass/*.sass'],
                tasks: ['sass:dev'],
                options: {
                    livereload: true
                }
            },
            statics: {
                files: ['front_end/*.html', 'front_end/libs/**', 'front_end/res/**', 'api/**', 'bower_components/**'],
                tasks: ['newer:copy:main'],
                options: {
                    livereload: true
                }
            },
            coffee: {
                files: ['front_end/coffee/**'],
                tasks: ['coffee:main'],
                options: {
                    livereload: true
                }
            }
        }
    });

    require('load-grunt-tasks')(grunt)
    grunt.registerTask('build', ['coffee', 'sass:dev', 'copy'])
    grunt.registerTask('default', ['build','watch']);

};