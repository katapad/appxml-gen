path = require 'path'

module.exports = (grunt) ->

  grunt.loadNpmTasks 'grunt-contrib-jade'


  APP_XML_BASE = 'tools/app_xml_config/base.jade'
  OUTPUT_APP_XML_DIR = 'common/appxml/'
  {appXmlConfig} = require './tools/app_xml_config/config.coffee'

  grunt.initConfig
    output_xml_dir: OUTPUT_APP_XML_DIR
    jade:
      android_dev:
        options:
          pretty: true
          data: appXmlConfig.getAndroidData(appXmlConfig.android.dev, appXmlConfig.dev)
        files: [ "<%= output_xml_dir %>android_dev.xml": APP_XML_BASE ]
      android_rel:
        options:
          pretty: true
          data: appXmlConfig.getAndroidData(appXmlConfig.android.rel, appXmlConfig.rel)
        files: [ "<%= output_xml_dir %>android_rel.xml": APP_XML_BASE ]
      ios_dev:
        options:
          pretty: true
          data: appXmlConfig.getIOSData(appXmlConfig.ios.dev, appXmlConfig.dev)
        files: [ "<%= output_xml_dir %>ios_dev.xml": APP_XML_BASE ]
      ios_dev_sim:
        options:
          pretty: true
          data: appXmlConfig.getIOSData(appXmlConfig.ios.dev, appXmlConfig.dev, true)
        files: [ "<%= output_xml_dir %>ios_dev_sim.xml": APP_XML_BASE ]
      ios_rel:
        options:
          pretty: true
          data: appXmlConfig.getIOSData(appXmlConfig.ios.rel, appXmlConfig.rel)
        files: [ "<%= output_xml_dir %>ios_rel.xml": APP_XML_BASE ]


  grunt.registerTask 'appxml', ["jade"]





  return