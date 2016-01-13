class CreateCallLists < ActiveRecord::Migration
  def change
    create_table :call_lists do |t|
      t.string :name
      t.string :phone
      t.text :description

      t.timestamps null: false
    end
  end
end
