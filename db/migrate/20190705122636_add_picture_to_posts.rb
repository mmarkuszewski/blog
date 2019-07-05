class AddPictureToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :picture_data, :text
  end
end
