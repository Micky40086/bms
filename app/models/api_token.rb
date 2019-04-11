class ApiToken < ApplicationRecord
  belongs_to :admin
  before_create :generate_token

  private

  def generate_token
    loop do
      token = SecureRandom.hex(10)
      break if !ApiToken.find_by_key(token)
    end
    self.key = SecureRandom.hex(10)
  end
end
