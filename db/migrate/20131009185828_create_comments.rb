class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body
      t.belongs_to :post
      # t.integer :post_id

      t.timestamps
    end
    add_index :comments, :post_id
  end
end
