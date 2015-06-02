
o = {}

o.task = -> 
  console.log 'Works!'

if typeof module == 'object' then module.exports = o