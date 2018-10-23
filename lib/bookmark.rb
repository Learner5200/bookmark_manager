require 'pg'
require 'pry'

ENV['ENVIRONMENT'] ||= 'development'

class Bookmark
  DATABASES = {
    'test' => 'bookmark_manager_test',
    'development' => 'bookmark_manager'
  }
  @connection = PG.connect( dbname: DATABASES[ENV['ENVIRONMENT']] )

  @bookmarks = []

  class << self
    attr_reader :bookmarks
  end

  def self.all
    rows = @connection.exec( "SELECT * FROM bookmarks" )
    rows.map do |row|
      Bookmark.new(row["name"], row["url"], row["id"])
    end
  end

  def self.create(name:, url:)
    result = @connection.exec( "INSERT INTO bookmarks (name, url) VALUES('#{name}', '#{url}') RETURNING id;" )
    id = result[0]["id"]
    Bookmark.new(name, url, id)
  end
end

class Bookmark
  attr_reader :name, :url, :id
  def initialize(name, url, id)
    @name, @url, @id = name, url, id
    Bookmark.bookmarks << self
  end
end
