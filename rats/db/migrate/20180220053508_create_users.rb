class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.string :country
      t.string :phone_number

      t.timestamps
    end
  end
end
