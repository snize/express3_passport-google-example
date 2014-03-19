module.exports = (grunt) ->
  require("load-grunt-tasks") grunt

  # Project configuration.
  grunt.initConfig
    watch:
      options:
        livereload: true
      express:
        options:
          spawn: false # Without this option specified express won't be reloaded
        files: ["**/*.handlebars", "app.js", "app/index.html"]
        tasks: ["express:dev", "delay"]

    express:
      options:
        debug: true
      dev:
        options:
          script: "app.js"

  grunt.registerTask "delay", "Delay for express restart", ->
    setTimeout @async(), 500

  grunt.registerTask "default", ["express:dev", "watch" ]
