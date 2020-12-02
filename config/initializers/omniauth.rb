require "rspotify/oauth"

Rails.application.config.to_prepare do OmniAuth::Strategies::Spotify.include SpotifyOmniauthExtension
end

Rails.application.config.middleware.use OmniAuth::Builder do
    provider :spotify, "use env", "use env", scope: "user-read-email playlist-modify-public"
end
