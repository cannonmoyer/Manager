class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name
      t.string :company
      t.string :account_number
      t.string :phone_one
      t.string :phone_two
      t.string :phone_three
      t.string :phone_four
      t.string :fax
      t.string :email
      t.string :street
      t.string :city
      t.string :state
      t.string :zip

      t.timestamps null: false
    end
  end
end
