feature 'delete bookmark' do
  before do
    @bookmark = Bookmark.create(name: "Google", url: "http://www.google.com")
    @bookmark_two = Bookmark.create(name: "Twitter", url: "http://www.twitter.com")
    visit '/bookmarks'
  end

  scenario 'should see delete button' do
    visit '/bookmarks'
    expect(page).to have_selector(:button, "Delete_#{@bookmark.id}")
  end

  scenario 'clicking button should delete bookmark' do
    click_button "Delete_#{@bookmark.id}"
    expect(page).to have_link('Twitter', href: 'http://www.twitter.com')
    expect(page).not_to have_link('Google', href: 'http://www.google.com')
  end
end
