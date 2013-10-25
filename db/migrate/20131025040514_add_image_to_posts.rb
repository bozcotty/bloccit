class AddImageToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :post_images, :string
  end
end
