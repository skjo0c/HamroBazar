class AddAdvertisementIdToCategories < ActiveRecord::Migration[5.0]
  def change
    add_column :categories, :advertisement_id, :integer
  end
end
