class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.time :time
      t.string :location
      t.string :title
      t.text :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
