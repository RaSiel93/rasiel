class DropUsers < ActiveRecord::Migration
  def up
    drop_table :users
  end

  def down
    create_table :users do |t|
      t.string :name
      t.string :access_token
    end
  end
end
