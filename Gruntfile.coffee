module.exports = (grunt)->
  grunt.initConfig
    copy:
      production:
        files: [
          {expand: true, cwd: 'src', src: ['**', '!bower.json'], dest: 'build/'}
        ]
    clean:
      production: ['build']

    mkdir:
      production:
        options:
          create: ["build"]
    shell:
      installBowerPackages:
        command: 'cd src; ../node_modules/bower/bin/bower install'

  grunt.loadNpmTasks 'grunt-mkdir'
  grunt.loadNpmTasks 'grunt-contrib-copy'
  grunt.loadNpmTasks 'grunt-contrib-clean'
  grunt.loadNpmTasks 'grunt-shell'

  grunt.registerTask "default", ["clean:production", "shell:installBowerPackages", "mkdir:production", "copy:production"]
  grunt.registerTask "cleanBuild", ["clean:production"]
