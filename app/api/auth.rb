class Auth < Grape::Middleware::Base
  def before
    token = ApiToken.find_by_key(env['HTTP_X_AUTH_HEADER'])
    env['API_ADMIN'] = token.admin if token
  end

  def after
  end
end