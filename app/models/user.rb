class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniouthable, :omniauth_providers => [:twitter]
  has_many :toots

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = "#{auth.info.nickname}@twitter.com"
      user.password = Devise.friendly_token[0,20]
      user.username = auth.info.nickname
    end
  end
end
