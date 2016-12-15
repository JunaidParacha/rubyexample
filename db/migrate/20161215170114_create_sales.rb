class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.references :shoe, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
