class AddSpotifyLoginToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :spotify_login, :text
  end
end
