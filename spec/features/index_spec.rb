feature "index page" do

  scenario "'/' should render an index page" do
    visit '/'
    expect(page).to have_content "Bookmark Manager"
  end
end
