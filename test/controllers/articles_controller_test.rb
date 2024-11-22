require "test_helper"

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  test "should get index" do
    get articles_url, headers: { "Content-Type": "application/x-www-form-urlencoded" }
    assert_response :success
    assert_equal "index", @controller.action_name
    assert_equal "application/x-www-form-urlencoded", @request.media_type
    assert_match "Articles", @response.body
  end

  test "should create article" do
    assert_difference("Article.count") do
      post articles_url, params: { article: { body: "Body with 20 characters", title: "My Title 2024", status: "public" } }
    end
    assert_redirected_to article_url(Article.last)
    assert_equal "Article was successfully created.", flash[:notice]
  end

  test "ajax request" do
    article = articles(:one)
    get article_url(article), xhr: true
    assert_equal "application/json", @response.media_type
    assert_equal "MyString", @response.parsed_body["title"]
  end

  test "should show article" do
    article = articles(:one)
    get article_url(article)
    assert_response :success
  end

  test "should destroy article" do
    article = articles(:one)
    assert_difference("Article.count", -1) do
      delete article_url(article)
    end

    assert_redirected_to root_path
  end

  test "should update article" do
    article = articles(:one)
    patch article_url(article), params: { article: { title: "updated", body: "require body more than 10", status: "public" } }
    assert_redirected_to article_path(article)
    # Reload association to fetch updated data and assert that title is updated.
    article.reload
    assert_equal "updated", article.title
  end
end
