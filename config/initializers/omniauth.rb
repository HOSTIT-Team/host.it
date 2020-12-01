require "rspotify/oauth"

Rails.application.config.to_prepare do OmniAuth::Strategies::Spotify.include SpotifyOmniauthExtension
end

Rails.application.config.middleware.use OmniAuth::Builder do
    provider :spotify, "9d38d852e3ef44e68630237054efceef", "0eec3ae0c2e249ba9313ec266eab476c", scope: "user-read-email playlist-modify-public"
end
