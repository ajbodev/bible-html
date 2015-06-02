
r = React.createElement

app.books = React.createClass do
  render: ->
    r 'ul', {}, 
      Bible.map ((el, i) -> 
        r 'li', {onClick: (!-> app.book_chapters i), 'data-book': app._booknames[i]}, app.booknames[i])

app.chapters = React.createClass do
  render: ->
    book = @props.book
    r 'ul', {}, 
      @props.Bible.map (el, i) -> 
        r 'li', {onClick: !-> (app.chapter_verses book, i)}, i

app.verses = React.createClass do
  render: ->
    book_chapter = @props.book_chapter
    r 'ul', {}, 
      @props.Bible.map (el, i) -> 
        r 'li', {}, 
          (app.booknames[book_chapter.book] + ' ' + book_chapter.chapter + ':' + i + ' ' + el)
        
app.book_chapters = (book) ->
  React.render (r app.chapters, {Bible: Bible[book], book: book}), (document.getElementById 'chapters')
        
app.chapter_verses = (book, chapter) ->
  console.log book + ' ' + chapter
  book_chapter = { book: book, chapter: chapter}
  React.render (r app.verses, Bible: Bible[book][chapter], book_chapter: book_chapter), (document.getElementById 'verses')
        
React.render (r app.books), (document.getElementById 'books')

app.verses_search = React.createClass do
  render: ->
    r 'ul', {}, @props.Bible
  
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
        results.push r 'li', {}, app.booknames[a] + ' ' + b + ':' + c + '  ' + Bible[a][b][c] if rgx.test Bible[a][b][c]
        c++
      b++
    a++
  React.render (r app.verses_search, Bible: results), (document.getElementById 'verses')
 
(document.getElementById 'search__button').onclick = !->
  input = document.getElementById 'search__text' .value
  app.search input