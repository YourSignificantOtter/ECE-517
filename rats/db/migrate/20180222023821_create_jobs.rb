class CreateJobs < ActiveRecord::Migration[5.1]
  def change
    create_table :jobs do |t|
      t.integer :company_id
      t.string :job_title
      t.string :employment_type
      t.text :job_description
      t.text :requirements
      t.text :responsibilities

      t.timestamps
    end
  end
end
