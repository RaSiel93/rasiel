class CreateUser < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
    end
  end
end
