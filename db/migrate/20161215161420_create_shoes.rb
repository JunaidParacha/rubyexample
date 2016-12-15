class CreateShoes < ActiveRecord::Migration
  def change
    create_table :shoes do |t|
      t.string :name
      t.references :user, index: true
      t.float :price

      t.timestamps
    end
  end
end
