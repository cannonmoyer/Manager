class AddCustomerRefToCertificate < ActiveRecord::Migration
  def change
    add_reference :certificates, :customer, index: true, foreign_key: true
  end
end
