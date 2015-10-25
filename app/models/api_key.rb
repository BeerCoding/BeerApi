class ApiKey < ActiveRecord::Base
  belongs_to :user
  before_save :generate_token

  def generate_token
    if self.token.nil? or self.token == ""
      self.token = SecureRandom.uuid
    end
  end
end
