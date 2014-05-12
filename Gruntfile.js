module.exports = function(grunt) {

    // Project configuration.
    grunt.initConfig({
        pkg: grunt.file.readJSON('package.json'),
        uglify: {
            options: {
                banner: '/*! <%= pkg.name %> <%= grunt.template.today("dd-mm-yy") %> */\n'
            },
            js: {
                files: {
                    'dev/js/main.min.js' : ['js/main.js']
                }
            },
            build: {
                src: '<%= pkg.name %>.js',
                dest: 'build/<%= pkg.name %>.min.js'
            }
        },
        compass: {
            dev: {
                options: {
                    sassDir: 'front_end/sass',
                    cssDir: 'dev/css'
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
            // js: {
            //     files: ['js/*.js'],
            //     tasks: ['uglify:js'],
            //     options: {
            //         livereload: true,
            //         atBegin: true
            //     }
            // },
            css: {
                files: ['front_end/sass/*.sass'],
                tasks: ['compass:dev'],
                options: {
                    livereload: true,
                    atBegin: true
                }
            },
            statics: {
                files: ['front_end/*.html', 'front_end/libs/**', 'front_end/res/**', 'api/**', 'bower_components/**'],
                tasks: ['newer:copy:main'],
                options: {
                    livereload: true,
                    atBegin: true
                }
            },
            coffee: {
                files: ['front_end/coffee/**'],
                tasks: ['coffee:main'],
                options: {
                    livereload: true,
                    atBegin: true
                }
            }
        }
    });

    require('load-grunt-tasks')(grunt)

    // Default task(s).
    // grunt.registerTask('watch', ['watch']);

};