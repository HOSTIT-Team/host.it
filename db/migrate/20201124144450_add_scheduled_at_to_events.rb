class AddScheduledAtToEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :scheduled_at, :datetime
  end
end
