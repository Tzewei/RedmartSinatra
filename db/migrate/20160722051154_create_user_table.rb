class CreateUserTable < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email, limit: 50
      t.string :address, limit: 50
      t.string :password, limit: 50
      t.string :cc_number, limit: 50
      t.string :date_joined, null: true

      t.timestamps
  end
  end
end
