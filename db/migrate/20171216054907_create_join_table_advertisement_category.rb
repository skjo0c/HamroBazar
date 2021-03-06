class CreateJoinTableAdvertisementCategory < ActiveRecord::Migration[5.0]
  def change
    create_join_table :advertisements, :categories do |t|
      t.index [:advertisement_id, :category_id], name: 'ad_cat'
      t.index [:category_id, :advertisement_id], name: 'cat_ad'
    end
  end
end
