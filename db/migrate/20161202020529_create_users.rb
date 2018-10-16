class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
        t.string :name
        t.string :email
        t.integer :phone
        t.string :address
        t.datetime :birthday
        t.string :avatar
    end
  end
end
