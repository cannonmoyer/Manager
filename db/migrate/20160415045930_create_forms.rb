class CreateForms < ActiveRecord::Migration
  def change
    create_table :forms do |t|
      t.text :content

      t.timestamps null: false
    end
  end
end
