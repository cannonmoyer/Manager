class AddCustomerRefToCancellation < ActiveRecord::Migration
  def change
    add_reference :cancellations, :customer, index: true, foreign_key: true
  end
end
