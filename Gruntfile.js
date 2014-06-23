module.exports = function(grunt) {
    grunt.initConfig({
        pkg: grunt.file.readJSON('package.json'),
        sass: {
            options: {
                includePaths: ['bower_components/foundation/scss']
            },
            dist: {
                files: {
                    'build/css/style.css': 'src/sass/style.sass'
                }
            }
        },
        copy: {
            main: {
                files: [
                    {cwd: 'src/', expand: true, src: ['*.html', 'res/**', 'css/**', 'js/**'], dest: 'build/'},
                    {cwd: 'src/api', expand: true, src: ['**'], dest: 'build/src/api', dot: true},
                    {cwd: 'bower_components', expand: true, src: ['**'], dest: 'build/bower_components'}
                ],
                nonull: true
            }
        },
        
        coffee: {
            main: {
                files: {
                    'build/js/app.js': ['src/coffee/**/*.coffee']
                }
            }
        },

        emberTemplates: {
            dist: {
                options: {
                    templateBasePath: 'src/templates/'
                },
                files: {
                    'build/js/templates.js': ['src/templates/**/*.hbs']
                }    
            }
        },

        compass: {
            dist: {
                options: {
                    sassDir: 'src/sass',
                    cssDir: 'build/css'
                }
            }
        },

        watch: {
            css: {
                files: ['src/sass/*.sass'],
                tasks: ['compass:dist'],
                options: {
                    livereload: true
                }
            },
            statics: {
                files: ['src/*.html', 'src/res/**', 'src/api/**', 'bower_components/**'],
                tasks: ['newer:copy:main'],
                options: {
                    livereload: true
                }
            },
            coffee: {
                files: ['src/coffee/**'],
                tasks: ['coffee:main'],
                options: {
                    livereload: true
                }
            },
            emberTemplates: {
                files: ['src/templates/**'],
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