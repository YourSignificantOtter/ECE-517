class CreateApplications < ActiveRecord::Migration[5.1]
  def change
    create_table :applications do |t|
      t.integer :job_id
      t.integer :user_id
      t.string :gender
      t.text :additional_info
      t.string :portfolio_url
      t.string :linkedin_url
      t.string :current_company
      t.string :disability_status
      t.string :veteran_status
      t.string :race

      t.timestamps
    end
  end
end
