class AddNewCustomerColumnToMessage < ActiveRecord::Migration
  def change
    add_column :messages, :new_customer, :boolean
  end
end
