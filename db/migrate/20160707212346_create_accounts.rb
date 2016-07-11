class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :line_number
      t.string :number
      t.string :name

      t.timestamps null: false
    end
  end
end
