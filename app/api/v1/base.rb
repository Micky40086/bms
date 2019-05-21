class V1::Base < Grape::API
  before do
    @current_admin = env['API_ADMIN']
    error!('Unauthorized', 401) unless @current_admin
  end

  mount V1::BlogArticle => '/blog_articles'
end
