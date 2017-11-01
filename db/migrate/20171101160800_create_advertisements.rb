class CreateAdvertisements < ActiveRecord::Migration[5.0]
  def change
    create_table :advertisements do |t|
      t.string :name, null: false
      t.integer :price, null: false
      t.text :description, null: false
      t.json :pictures

      t.timestamps
    end
  end
end
