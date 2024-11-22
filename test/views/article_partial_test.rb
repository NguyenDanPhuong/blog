require "test_helper"

class ArticlePartialTest < ActionView::TestCase
  test "should render article partial" do
    article = Article.create! title: "Test Title", body: "Test Body 123456", status: "public"
    render partial: "articles/article", locals: { article: article }
    assert_includes rendered, article.title
    assert_select "a[href=?]", edit_article_path(article), text: "Edit"
  end

  test "renders HTML" do
    article = Article.create!(title: "Hello, world", body: "Test Body 123456", status: "public")

    render partial: "articles/article", locals: { article: article }

    assert_pattern { rendered.html.at("h1") => { content: "Hello, world" } }
  end

  test "renders JSON" do
    article = Article.create!(title: "Hello, world", body: "Test Body 123456", status: "public")

    render formats: :json, partial: "articles/article", locals: { article: article }

    assert_pattern { rendered.json => { title: "Hello, world" } }
  end
end
