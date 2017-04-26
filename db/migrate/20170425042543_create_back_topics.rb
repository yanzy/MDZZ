class CreateBackTopics < ActiveRecord::Migration
  def change
    create_table :back_topics do |t|
      t.string :title
      t.text  :content
      t.integer :user_id, :null => false
      t.integer :status, :default => 1, :null => false
      t.datetime "created_at",  :null => false
      t.datetime "updated_at", :null => false
    end
  end
end
