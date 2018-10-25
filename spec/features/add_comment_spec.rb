feature "adding comments" do
  before do
    @bookmark = Bookmark.create(name: "Facebook", url: "http://www.facebook.com")
    visit '/'
  end

  scenario "user sees comment button next to bookmarks" do
    expect(page).to have_selector(:button, "Comment_#{@bookmark.id}")
  end

  context "user clicks comment button" do
    before { click_button "Comment_#{@bookmark.id}" }
    scenario "user sees comment form" do
      expect(page).to have_field(:comment)
    end

    scenario "user can add comment and see it on bookmarks page" do
      fill_in(:comment, with: "Sweet link bro")
      click_button "Submit"
      expect(page).to have_content("Sweet link bro")
      expect(page).to have_current_path("/bookmarks")
    end
  end
end
