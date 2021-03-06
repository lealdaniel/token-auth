class User < ApplicationRecord

  has_many :items

  def self.from_omniauth(auth)
    # Creates a new user only if it doesn't exist
    where(email: auth.info.email).first_or_create do |user|
      user.name = auth.info.name
      user.email = auth.info.email
      user.profile_url = auth.info.image
    end

  end
end
