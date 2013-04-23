class User < ActiveRecord::Base
  attr_accessible :oauth_expires_at, :oauth_token, :provider, :uid
  mount_uploader :avatar, AvatarUploader

  class << self
    def from_omniauth(auth)
      where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.name = auth.info.name
        user.oauth_token = auth.credentials.token
        user.oauth_expires_at = Time.at(auth.credentials.expires_at)
        user.remote_avatar_url = if auth.provider == 'vkontakte'
          auth.extra.raw_info.photo_big
        else
          auth.info.image
        end
        user.save!
      end
    end
  end
end
