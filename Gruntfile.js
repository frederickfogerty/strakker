module.exports = function(grunt) {
    grunt.initConfig({
        pkg: grunt.file.readJSON('package.json'),
        sass: {
            options: {
                includePaths: ['bower_components/foundation/scss']
            },
            dist: {
                files: {
                    'dev/css/style.css': 'front_end/sass/style.sass'
                }
            }
        },
        copy: {
            main: {
                files: [
                    {cwd: 'front_end/', expand: true, src: ['*.html', 'res/**', 'css/**'], dest: 'dev/'},
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

        emberTemplates: {
            dist: {
                options: {
                    templateBasePath: 'front_end/templates/'
                },
                files: {
                    'dev/js/templates.js': ['front_end/templates/**/*.hbs']
                }    
            }
        },

        compass: {
            dist: {
                options: {
                    sassDir: 'front_end/sass',
                    cssDir: 'dev/css'
                }
            }
        },

        watch: {
            css: {
                files: ['front_end/sass/*.sass'],
                tasks: ['compass:dist'],
                options: {
                    livereload: true
                }
            },
            statics: {
                files: ['front_end/*.html', 'front_end/res/**', 'api/**', 'bower_components/**'],
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
            },
            emberTemplates: {
                files: ['front_end/templates/**'],
                tasks: ['emberTemplates:dist'],
                options: {
                    livereload: true
                }
            }
        }
    });

    require('load-grunt-tasks')(grunt)
    grunt.registerTask('build', ['coffee', 'compass:dist', 'copy', 'emberTemplates'])
    grunt.registerTask('default', ['build','watch']);

};