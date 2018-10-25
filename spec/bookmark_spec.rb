require "bookmark"
require "comment"
require 'pry'

describe Bookmark do

  describe '.all' do

    before do
      @bookmark_one = Bookmark.create(name: "Facebook", url: "http://www.facebook.com")
      @bookmark_two = Bookmark.create(name: "Twitter", url: "http://www.twitter.com")
    end

    it 'returns list of bookmarks' do
      Bookmark.all.each do |item|
        expect(item).to be_a Bookmark
      end
    end

    it 'returns parameters that were put into the database' do
      first_item = Bookmark.all[0]
      expect(first_item.name).to eq @bookmark_one.name
      expect(first_item.url).to eq @bookmark_one.url
      expect(first_item.id).to eq @bookmark_one.id
    end
  end

  describe '.create' do
    it 'creates a new bookmark with parameters given' do
      bookmark = Bookmark.create(name: "Facebook", url: "http://www.facebook.com")
      expect(bookmark).to be_a Bookmark
      expect(bookmark.name).to eq "Facebook"
      expect(bookmark.url).to eq "http://www.facebook.com"
    end

    it 'does not create bookmark with invalid url' do
      Bookmark.create(name: "fake", url: "INVALID")
      expect(Bookmark.all.length).to be_zero
    end
  end

  describe '.delete' do
    it 'deletes the bookmark with corresponding id from the database' do
      bookmark = Bookmark.create(name: "Facebook", url: "http://www.facebook.com")
      Bookmark.delete(bookmark.id)
      expect(Bookmark.all.length).to be_zero
    end
  end

  describe '.find' do
    it 'returns bookmark object matching the passed id' do
      bookmark = Bookmark.create(name: "Facebook", url: "http://www.facebook.com")
      result = Bookmark.find(bookmark.id)
      # nb objects won't be identical, but should have identical data
      expect(result.id).to eq bookmark.id
      expect(result.name).to eq bookmark.name
      expect(result.url).to eq bookmark.url
    end
  end

  describe '.update' do
    it 'changes details of object in database matching passed id' do
      bookmark = Bookmark.create(name: "Facebook", url: "http://www.facebook.com")
      Bookmark.update(bookmark.id, "Google", "http://www.google.com")
      new_bookmark = Bookmark.all.first
      expect(new_bookmark.id).to eq bookmark.id
      expect(new_bookmark.name).to eq "Google"
      expect(new_bookmark.url).to eq "http://www.google.com"
    end
  end

  describe '#comments' do
    before do
      @bookmark = Bookmark.create(name: "Facebook", url: "http://www.facebook.com")
      @comment_one = Comment.create(bookmark_id: @bookmark.id, text: "Nice link bro")
      @comment_two = Comment.create(bookmark_id: @bookmark.id, text: "I concur")
    end

    it 'returns an array of comment objects' do
      @bookmark.comments.each do |comment|
        expect(comment).to be_a Comment
      end
    end

    it 'returns all the comments' do
      expect(@bookmark.comments.length).to eq 2
    end

    it 'returns comments with original parameters' do
      first_comment = @bookmark.comments[0]
      expect(first_comment.text).to eq "Nice link bro"
      expect(first_comment.bookmark_id).to eq @bookmark.id
      expect(first_comment.id).to eq @comment_one.id
    end
  end

end
