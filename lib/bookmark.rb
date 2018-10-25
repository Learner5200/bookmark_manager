require 'pry'
require 'uri'
require 'comment'

class Bookmark

  def self.all
    query = "SELECT * FROM bookmarks"
    rows = DatabaseConnection.query(query)
    rows.map do |row|
      Bookmark.new(row["name"], row["url"], row["id"])
    end
  end

  def self.create(name:, url:)
    query = "INSERT INTO bookmarks (name, url) VALUES('#{name}', '#{url}') RETURNING id;"
    return false unless is_url?(url)
    result = DatabaseConnection.query(query)
    id = result[0]["id"]
    Bookmark.new(name, url, id)
  end

  def self.delete(id)
    query = "DELETE FROM bookmarks WHERE id = '#{id}';"
    DatabaseConnection.query(query)
  end

  def self.find(id)
    query = "SELECT * FROM bookmarks WHERE id = '#{id}';"
    result = DatabaseConnection.query(query).first
    Bookmark.new(result["name"], result["url"], result["id"])
  end

  def self.update(id, new_name, new_url)
    query = "UPDATE bookmarks SET name = '#{new_name}', url = '#{new_url}' WHERE id = '#{id}';"
    DatabaseConnection.query(query)
  end

  private
  def self.is_url?(string)
    string.match(/\A#{URI::regexp(['http', 'https'])}\z/)
  end
end

class Bookmark
  attr_reader :name, :url, :id, :comments
  def initialize(name, url, id)
    @name, @url, @id = name, url, id
  end

  def comments
    query = "SELECT * FROM comments WHERE bookmark_id = '#{@id}';"
    rows = DatabaseConnection.query(query)
    rows.map do |row|
      Comment.new(id: row["id"], bookmark_id: @id, text: row["text"])
    end
  end
end
