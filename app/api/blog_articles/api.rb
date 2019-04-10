class BlogArticles::API < Grape::API
  before do
    error!('Unauthorized', 401) unless headers['X-Auth-Header'] === 'Mickey'
  end

  mount BlogArticles::V1 => '/v1/blog_articles'
end
