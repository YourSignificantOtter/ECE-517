class CreateCompanies < ActiveRecord::Migration[5.1]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :headquarters
      t.string :website
      t.string :size
      t.text :synopsis
      t.integer :founded
      t.string :industry
      t.string :revenue

      t.timestamps
    end
  end
end
