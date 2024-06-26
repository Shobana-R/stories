class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.text :content
      t.string :user_name
      t.references :story, null: false, foreign_key: true
      t.integer :parent_comment_id

      t.timestamps
    end

    add_foreign_key :comments, :comments, column: :parent_comment_id
  end
end
