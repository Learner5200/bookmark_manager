require 'pg'
require 'bookmark'

def setup_test_database
  DatabaseConnection.setup('bookmark_manager_test')
  DatabaseConnection.query('TRUNCATE bookmarks, comments;')
end

def add_bookmarks
    Bookmark.create(name: 'Makers Academy', url: 'http://www.makersacademy.com')
    Bookmark.create(name: 'Destroy All Software', url: 'http://www.destroyallsoftware.com')
    Bookmark.create(name: 'Google', url: 'http://www.google.com')
end
