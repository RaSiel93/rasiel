class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.string :title
      t.text :text
      t.boolean :published
      t.datetime :date

      t.belongs_to :diary
      t.timestamps
    end
  end
end
