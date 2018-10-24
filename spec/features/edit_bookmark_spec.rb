feature "edit bookmarks" do
  before do
    @bookmark = Bookmark.create(name: "Facebook", url: "http://www.facebook.com")
    visit '/'
  end
  scenario "bookmarks page should have edit button" do
    expect(page).to have_selector(:button, "Edit_#{@bookmark.id}")
  end

  scenario "clicking edit button should take user to edit page" do
    click_button "Edit_#{@bookmark.id}"
    expect(page).to have_field("URL", with: "http://www.facebook.com")
    expect(page).to have_field("Name", with: "Facebook")
  end

  scenario "submitting edit should update bookmark page" do
    click_button "Edit_#{@bookmark.id}"
    fill_in("Name", with: "Twitter")
    fill_in("URL", with: "http://www.twitter.com")
    click_button 'Submit'
    expect(page).not_to have_link('Facebook', href: 'http://www.facebook.com')
    expect(page).to have_link('Twitter', href: 'http://www.twitter.com')
  end
end
