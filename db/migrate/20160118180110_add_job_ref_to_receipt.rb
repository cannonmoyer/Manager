class AddJobRefToReceipt < ActiveRecord::Migration
  def change
    add_reference :receipts, :job, index: true, foreign_key: true
  end
end
