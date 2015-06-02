
App = Ember.Application.create!

App.BibleHtmlComponent = Ember.Component.extend do
  #books: app.booknames
  books: do ->
    o = []
    for i, j in app.booknames
      if j > 0 then o.push {book: app.booknames[j], _book: app._booknames[j]}
    o
  book: 0
  chapters: []
  verses: []
  actions:
    search: !->
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
              results.push app.booknames[a] + ' ' + b + ':' + c + '  ' + Bible[a][b][c] if rgx.test Bible[a][b][c]
              c++
            b++
          a++
        results
      input = document.getElementById 'search__text' .value
      alert input
      @verses = app.search input
  searchText: 'search'
  click: (main) !->
    action = main.toElement.parentElement.id
    actions = 
      'book': ->
        book = app.booknames.indexOf main.toElement.innerText
        book
      'book-chapters': ->
        book = app.booknames.indexOf main.toElement.innerText
        chapters = []
        ch = 
          0 50 40 27 36 34 24 21 4 31 24 22 25 29 36 10 13 10 42 
          150 31 12 8 66 52 5 48 12 14 3 9 1 4 7 3 3 3 2 14 4 
          28 16 24 21 28 16 16 13 6 6 4 4 5 3 6 4 3 1 13 5 5 3 5 1 1 1 22   
        for i from 1 to ch[book]
          chapters.push i
        chapters
      'chapter-verses': (book) ->
        chapter = main.toElement.
        verses = []
        for verse, id in Bible[book][chapter]
          verses.push app.booknames[book] + ' ' + chapter + ':' + id + ' ' + verse
        verses.shift!
        verses
    
    @book = actions['book']! if action == 'book-chapters'
    _book = @book
    @chapters = actions['book-chapters']! if action == 'book-chapters'
    @verses = (actions['chapter-verses'] _book) if action == 'chapter-verses'
    @rerender!
    
