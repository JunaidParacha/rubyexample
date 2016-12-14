class CreateEvens < ActiveRecord::Migration
  def change
    create_table :evens do |t|
      t.string :name
      t.date :date
      t.string :location
      t.string :state
      t.references :user, index: true

      t.timestamps
    end
  end
end
