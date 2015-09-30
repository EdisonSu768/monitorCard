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
      rename:
        command: 'cd src; mv bower_components thirdpartlib'
      unpublish:
        command: 'git tag -d 0.0.1; git push origin :refs/tags/0.0.1'
      publish:
        command: 'git tag 0.0.1; git push origin 0.0.1'

  grunt.loadNpmTasks 'grunt-mkdir'
  grunt.loadNpmTasks 'grunt-contrib-copy'
  grunt.loadNpmTasks 'grunt-contrib-clean'
  grunt.loadNpmTasks 'grunt-shell'

  grunt.registerTask "default", ["clean:production", "shell:installBowerPackages", "shell:rename", "mkdir:production", "copy:production"]
  grunt.registerTask "cleanBuild", ["clean:production"]
  grunt.registerTask "release", ["shell:unpublish", "shell:publish"]
