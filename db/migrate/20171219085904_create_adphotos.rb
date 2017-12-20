class CreateAdphotos < ActiveRecord::Migration[5.0]
  def change
    create_table :adphotos do |t|
      t.references :advertisement, foreign_key: true
      t.string :picture

      t.timestamps
    end
  end
end
