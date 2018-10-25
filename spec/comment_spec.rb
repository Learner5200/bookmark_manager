require 'comment'
require 'bookmark'

describe Comment do
  describe '.create' do
    it 'creates a new comment with the text given' do
      bookmark = Bookmark.create(name: "Facebook", url: "http://www.facebook.com")
      comment = Comment.create(bookmark_id: bookmark.id, text: "example")
      expect(comment).to be_a Comment
      expect(comment.text).to eq "example"
      expect(comment.bookmark_id).to eq bookmark.id
    end
  end
end
