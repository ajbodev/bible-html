
app.verses = (book, chapter) -> -> 
  list = m 'ul', [Bible[book][chapter].map ((el, k) -> 
    m 'li', app.booknames[book] + ' ' + chapter + ':' + k + ' ' + Bible[book][chapter][k])]
  m.render (document.getElementById 'verses'), [list]
  
app.chapters = (book) -> ->
  list = m 'ul', [Bible[book].map ((el, j) -> m 'li', {onclick: (app.verses book, j)}, j)]
  m.render (document.getElementById 'chapters'), [list]

app.books = m 'ul', [Bible.map ((el, i) -> m 'li', 
  {'data-book': app._booknames[i], onclick: (app.chapters i)}, app.booknames[i])]
    
m.render (document.getElementById 'books'), [app.books]

app.search = (inp) ->
  results = []
  rgx = new RegExp inp
  ch = 
    50 40 27 36 34 24 21 4 31 24 22 25 29 36 10 13 10 42 
    150 31 12 8 66 52 5 48 12 14 3 9 1 4 7 3 3 3 2 14 4 
    28 16 24 21 28 16 16 13 6 6 4 4 5 3 6 4 3 1 13 5 5 3 5 1 1 1 22   
  a = 1
  while a <= 66
    b = 1
    while b <= ch[a - 1]
      c = 1
      while c <= Bible[a][b].length
        results.push m 'li', app.booknames[a] + ' ' + b + ':' + c + '  ' + Bible[a][b][c] if rgx.test Bible[a][b][c]
        c++
      b++
    a++
  m.render (document.getElementById 'verses'), [m 'ul', results]
 
(document.getElementById 'search__button').onclick = !->
  input = document.getElementById 'search__text' .value
  app.search input