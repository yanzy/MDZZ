class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string :name
      t.integer :user_id
      t.boolean :status
      t.references :imageable, polymorphic: true, index: true
      t.string :description
      t.datetime "created_at",  :null => false
      t.datetime "updated_at", :null => false
    end
  end
end
