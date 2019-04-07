class PageController < ApplicationController
  def login
  end

  def is_login
    custom_options = {:verify_iat => true, :verify_aud => true, :aud => "bms-c6fdd", :verify_iss => true, :iss => "https://securetoken.google.com/bms-c6fdd"}
    firebase_jwt_token = params[:token]
    jwt_decode = JWT.decode(firebase_jwt_token, nil, false, custom_options)
    session[:user_uid] = jwt_decode[0]["user_id"]
    puts jwt_decode
    render json: {message: "login success"}, status: 200
  end
end
