class ApiRoot < Grape::API
  PREFIX = :api

  format :json

  mount BlogArticles::API
end