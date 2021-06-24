class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[google_oauth2]

  has_many :tasks, :dependent => :destroy
  has_many :comments, :dependent => :destroy
  has_many :projects, :dependent => :destroy
  has_many :tags, :dependent => :destroy
  has_many :searches, :dependent => :destroy

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      # deviseのuserカラムに name を追加している場合は以下のコメントアウトも追記します
      # user.name = auth.info.name
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
  end

end
