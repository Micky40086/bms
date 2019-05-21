class V1::BlogArticle < Grape::API
  get '/list' do
    list = []
    blog_articles = @current_admin.blog_articles.includes(:blog_tags)
    present blog_articles, with: V1::Entities::BlogArticle
  end
end