
gulp       = require 'gulp'
global.use = require './tasks/use.ls'

jade       = use 'jade'

build = 
  'mithril': {src: 'src/mithril/index.jade', dest: 'dist/'}
  'angular': {src: 'src/angular/index.jade', dest: 'dist/angular/'}
  'react':   {src: 'src/react/index.jade',   dest: 'dist/react/'}
  'ember':   {src: 'src/ember/index.jade',   dest: 'dist/ember/'}
  'riot':    {src: 'src/riot/index.jade',    dest: 'dist/riot/'}

# gulp compile-mithril | gulp watch-mithril
# gulp compile-angular | gulp watch-angular
# gulp compile-react   | gulp watch-react
# gulp compile-ember   | gulp watch-ember
# gulp compile-riot    | gulp watch-riot
jade.taskAll '', build