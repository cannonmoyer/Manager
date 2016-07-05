class CreateCertificates < ActiveRecord::Migration
  def change
    create_table :certificates do |t|
      t.boolean :burglary
      t.boolean :fire
      t.boolean :panic
      t.boolean :hold_up
      t.string :account_number
      t.date :start_date
      t.date :renewal_date
      t.string :fax
      t.string :attention

      t.timestamps null: false
    end
  end
end
