class AddCustomerRefToMessage < ActiveRecord::Migration
  def change
    add_reference :messages, :customer, index: true, foreign_key: true
  end
end
