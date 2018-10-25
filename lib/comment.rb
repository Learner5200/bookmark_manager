class Comment
  def self.create(bookmark_id:, text:)
    query = "INSERT INTO comments (text, bookmark_id) VALUES('#{text}', #{bookmark_id}) RETURNING id;"
    result = DatabaseConnection.query(query)
    id = result[0]["id"]
    Comment.new(id: id, bookmark_id: bookmark_id, text: text)
  end

  attr_reader :id, :bookmark_id, :text
  def initialize(id:, bookmark_id:, text:)
    @id, @bookmark_id, @text = id, bookmark_id, text
  end
end
