
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
  
o.task = (_o) !-> # Watch-Compile
  _compile = 'compile-' + _o.task
  gulp.task _compile, -> o.compile _o # Compile task
  gulp.task 'watch-' + _o.task , [_compile], -> gulp.watch [_o.src], [_compile]

o.taskAll = (_o) !-> # Generate tasks
  for let index, params of _o
    o.task params

if typeof module == 'object' then module.exports = o