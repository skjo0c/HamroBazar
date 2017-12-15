class AddCategoryIdToAdvertisements < ActiveRecord::Migration[5.0]
  def change
    add_column :advertisements, :category_id, :integer
  end
end
