require "test_helper"

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  test "should get index" do
    get articles_url
    assert_response :success
  end

  test "should create article" do
    assert_difference("Article.count") do
      post articles_url, params: { article: { body: "Body with 20 characters", title: "My Title 2024", status: "public" } }
    end
    assert_redirected_to article_url(Article.last)
  end

  test "ajax request" do
    article = articles(:one)
    get article_url(article), xhr: true
    assert_equal "application/json", @response.media_type
    assert_equal "MyString", @response.parsed_body["title"]
  end
end
