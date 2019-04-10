class BlogArticles::V1 < Grape::API
  get '/list' do
    {message: 'HEHE'}
  end
end
