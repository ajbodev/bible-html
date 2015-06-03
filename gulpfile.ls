
gulp       = require 'gulp'
global.use = require './tasks/use.ls'

jade  = use 'jade'

build = 
  * name: 'Bible' task: 'mithril' src: 'src/mithril/index.jade' dest: 'dist/'
  * name: 'Bible' task: 'angular' src: 'src/angular/index.jade' dest: 'dist/angular/'
  * name: 'Bible' task: 'react'   src: 'src/react/index.jade'   dest: 'dist/react/'
  * name: 'Bible' task: 'ember'   src: 'src/ember/index.jade'   dest: 'dist/ember/'
  * name: 'Bible' task: 'riot'    src: 'src/riot/index.jade'    dest: 'dist/riot/'
 
# gulp compile-<task> | gulp watch-<task>
jade.taskAll build