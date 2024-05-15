class CreateStories < ActiveRecord::Migration[7.1]
  def change
    create_table :stories do |t|
      t.string :title
      t.string :url
      t.text :description
      t.integer :upvotes
      t.string :user_name

      t.timestamps
    end
  end
end
