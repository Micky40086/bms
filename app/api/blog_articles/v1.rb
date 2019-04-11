class BlogArticles::V1 < Grape::API
  get '/list' do
    @current_admin.blog_articles
  end
end
