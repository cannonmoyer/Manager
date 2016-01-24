class CreateReceipts < ActiveRecord::Migration
  def change
    create_table :receipts do |t|
      t.text :information

      t.timestamps null: false
    end
  end
end
