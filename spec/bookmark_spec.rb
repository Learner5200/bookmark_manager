require "bookmark"
require 'pry'

describe Bookmark do

  describe '.all' do

    before do
      @bookmark_one = Bookmark.create(name: "Facebook", url: "www.facebook.com")
      @bookmark_two = Bookmark.create(name: "Twitter", url: "www.twitter.com")
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
    it 'creates a new bookmark' do
      bookmark = Bookmark.create(name: "Facebook", url: "http://www.facebook.com")
      expect(bookmark).to be_a Bookmark
      expect(bookmark.name).to eq "Facebook"
      expect(bookmark.url).to eq "http://www.facebook.com"
    end

  end
end