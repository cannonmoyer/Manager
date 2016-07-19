class CreateCancellations < ActiveRecord::Migration
  def change
    create_table :cancellations do |t|
      t.date :date
      t.string :account_number
      t.date :start_date
      t.date :renewal_date
      t.date :sent_date
      t.float :landline_monitoring
      t.float :cell_monitoring
      t.boolean :verified_cancellation
      t.string :to
      t.boolean :cancel_pink
      t.boolean :cleared_account_balance
      t.boolean :remove_from_mem_tx
      t.boolean :cancel_insurance
      t.boolean :note_customer_account
      t.boolean :cell_radio
      t.boolean :cancel_cell_radio

      t.timestamps null: false
    end
  end
end
