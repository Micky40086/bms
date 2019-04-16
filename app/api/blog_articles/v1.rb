class BlogArticles::V1 < Grape::API
  get '/list' do
    list = []
    blog_articles = @current_admin.blog_articles.includes(:blog_tags)
    blog_articles.each do |article|
      list << article.as_json.merge(tags: article.blog_tags.as_json)
    end
    list
  end
end
