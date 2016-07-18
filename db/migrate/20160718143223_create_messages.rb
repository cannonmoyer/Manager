class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :description

      t.timestamps null: false
    end
  end
end
