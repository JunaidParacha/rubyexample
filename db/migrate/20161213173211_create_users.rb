class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :Last_name
      t.string :email
      t.string :location
      t.string :state
      t.string :password_digest

      t.timestamps
    end
  end
end
