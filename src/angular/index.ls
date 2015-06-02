
app.books = ($scope, $rootScope) !->
  books = []
  for book, id in app.booknames
    books.push {id: id, book: book, _book: app._booknames[id]}
  
  $scope.books = books
  $scope.book_chapters = (book_id) !-> 
    $rootScope.$broadcast 'event_book_chapters', book_id
    
app.chapters = ($scope, $rootScope) !->
  $scope.chapter_book = 0
  $scope.chapters = []
    
  $scope.$on 'event_book_chapters', (event, book_id) !-> 
    chapters = []
    ch = 
      0 50 40 27 36 34 24 21 4 31 24 22 25 29 36 10 13 10 42 
      150 31 12 8 66 52 5 48 12 14 3 9 1 4 7 3 3 3 2 14 4 
      28 16 24 21 28 16 16 13 6 6 4 4 5 3 6 4 3 1 13 5 5 3 5 1 1 1 22   
    for i from 1 to ch[book_id]
      chapters.push i
    $scope.chapters = chapters
    $scope.chapter_book = book_id
  
  $scope.chapter_verses = (chapter) !-> 
    $rootScope.$broadcast do
      'event_book_chapter_verses', {book: $scope.chapter_book, chapter: chapter}
    
app.verses = ($scope, $rootScope) !->
  $scope.verses = []
    
  $scope.$on 'event_book_chapter_verses', (event, book_chapter) !-> 
    verses = []
    for verse, id in Bible[book_chapter.book][book_chapter.chapter]
      verses.push app.booknames[book_chapter.book] + ' ' + book_chapter.chapter + ':' + id + ' ' + verse
    verses.shift!
    $scope.verses = verses
    
  $scope.$on 'event_search_verses', (event, results) !->
    $scope.verses = results
    
app.search_verses = ($scope, $rootScope) !->
  $scope.search_text = ''
    
  $scope.search_verses = !-> 
    $rootScope.$broadcast 'event_search_verses', app.search $scope.search_text
    
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

app.ng = angular.module 'app', []
  .controller 'books',  app.books
  .controller 'chapters',  app.chapters
  .controller 'verses',  app.verses
  .controller 'search_verses',  app.search_verses