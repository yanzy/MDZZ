class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
        t.string :name
        t.string :created_by
        t.string :description
        t.datetime :created_at
        t.datetime :updated_at
        t.boolean :right

    end
  end
end
