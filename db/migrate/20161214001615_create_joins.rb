class CreateJoins < ActiveRecord::Migration
  def change
    create_table :joins do |t|
      t.references :user, index: true
      t.references :even, index: true

      t.timestamps
    end
  end
end
