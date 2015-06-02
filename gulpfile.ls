
gulp       = require 'gulp'
global.use = require './tasks/use.ls'

jade       = use 'jade'

build = 
  'mithril': {name: 'Bible' src: 'src/mithril/index.jade', dest: 'dist/'}
  'angular': {name: 'Bible' src: 'src/angular/index.jade', dest: 'dist/angular/'}
  'react':   {name: 'Bible' src: 'src/react/index.jade',   dest: 'dist/react/'}
  'ember':   {name: 'Bible' src: 'src/ember/index.jade',   dest: 'dist/ember/'}
  'riot':    {name: 'Bible' src: 'src/riot/index.jade',    dest: 'dist/riot/'}

# gulp compile-mithril | gulp watch-mithril
# gulp compile-angular | gulp watch-angular
# gulp compile-react   | gulp watch-react
# gulp compile-ember   | gulp watch-ember
# gulp compile-riot    | gulp watch-riot
jade.taskAll '', build