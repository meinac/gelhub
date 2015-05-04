class User < ActiveRecord::Base
  
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  def self.from_oauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name
      user.image = auth.info.image
    end
  end

end
