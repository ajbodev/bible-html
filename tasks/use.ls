
module.exports = (namespace) ->
  path = require 'path'
  require ((path.join __dirname, '..').replace //\\//g, '/') + '/tasks/' + namespace + '.ls'