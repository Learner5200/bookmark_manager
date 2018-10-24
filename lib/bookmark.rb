require 'pry'

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
end

class Bookmark
  attr_reader :name, :url, :id
  def initialize(name, url, id)
    @name, @url, @id = name, url, id
  end
end
