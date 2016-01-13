class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.date :date
      t.string :time
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.text :special_job_instructions
      t.text :description
      t.text :work_completed
      t.text :billing_information
      t.text :notes
      t.string :status

      t.timestamps null: false
    end
  end
end
