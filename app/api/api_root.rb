class ApiRoot < Grape::API
  PREFIX = :api
  format :json
  use Auth

  route :any, '*path' do
    error!('404 Not Found', 404) # or something else
  end
  
  mount BlogArticles::API
end