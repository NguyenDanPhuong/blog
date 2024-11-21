require "application_system_test_case"

class ArticlesTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit articles_url
    assert_selector "h1", text: "Articles"
  end

  test "creating a Article" do
    visit articles_url
    click_on "New Article"
    fill_in "Title", with: "My Title 2024"
    fill_in "Body", with: "Body with 20 characters"
    click_on "Create Article"
    assert_text "My Title 2024"
  end
end
