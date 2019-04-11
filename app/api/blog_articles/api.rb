class BlogArticles::API < Grape::API
  before do
    @current_admin = env['API_ADMIN']
    error!('Unauthorized', 401) unless @current_admin
  end

  mount BlogArticles::V1 => '/v1/blog_articles'
end
