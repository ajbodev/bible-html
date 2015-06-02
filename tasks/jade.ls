
gulp    = require 'gulp'
jade    = require 'gulp-jade'
plumber = require 'gulp-plumber'
rename  = require 'gulp-rename'

o = {}

o.compile = (_o) -> # Compile
  gulp.src _o.src
  .pipe plumber!
  .pipe jade pretty: true
  .pipe rename (path) !->
    if _o.ext then path.extname = _o.ext
    if _o.name then path.basename = _o.name
  .pipe gulp.dest _o.dest
  
o.watchCompile = (_o) !-> # Watch-Compile
  gulp.watch [_o.src], [_o.task]

o.taskAll = (namespace, _o) !-> # Generate tasks
  for let index, params of _o
    _compile = 'compile-' + namespace + index
    gulp.task _compile, -> o.compile params # Compile task
    gulp.task 'watch-' + namespace + index , [_compile], -> # Watch task
      (o.watchCompile {src: params.src, task: _compile}) 

if typeof module == 'object' then module.exports = o