class CreateAudios < ActiveRecord::Migration
  def change
    create_table :audios do |t|
      t.string :artist
      t.string :title
      t.string :url
      t.integer :playlist_id

      t.timestamps
    end
  end
end
