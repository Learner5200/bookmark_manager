feature "add bookmark" do
  before do
    visit '/bookmarks'
    click_button 'Add Bookmark'
  end

  scenario "user can view a form for adding a new bookmark" do
    expect(page).to have_field("URL")
    expect(page).to have_field("Name")
  end

  scenario "new bookmark is added to bookmarks page" do
    fill_in("Name", with: "Facebook")
    fill_in("URL", with: "http://www.facebook.com")
    click_button 'Submit'
    expect(page).to have_link('Facebook', href: 'http://www.facebook.com')
  end

  scenario "error message if url invalid" do
    fill_in("Name", with: "Facebook")
    fill_in("URL", with: "INVALID")
    click_button 'Submit'
    expect(page).not_to have_content('Facebook')
    expect(page).to have_content('Please enter a valid URL.')
  end

end
