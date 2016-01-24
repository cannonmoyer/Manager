class AddEmailToReceipt < ActiveRecord::Migration
  def change
    add_column :receipts, :email, :string
  end
end
