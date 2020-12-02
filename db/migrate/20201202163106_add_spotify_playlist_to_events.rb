class AddSpotifyPlaylistToEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :spotify_playlist, :string
  end
end
