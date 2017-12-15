class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
    	t.string :firstname, null: false
    	t.string :lastname, null: false
    	t.string :email, uniqueness: true, null: false
    	t.string :mobile, null: false
      t.timestamps
    end
  end
end
