class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:google_oauth2]

  has_many :blog_articles
  has_many :api_tokens
  
  def self.from_omniauth(access_token)
    data = access_token.info
    admin = Admin.where(email: data["email"]).first

    # Uncomment the section below if you want admins to be created if they don't exist
    unless admin
      admin = Admin.create(name: data["name"],
                           email: data["email"],
                           password: Devise.friendly_token[0, 20],
                           provider: access_token.provider)
    end
    admin
  end
end
