class RemoveTimeColumnFromJob < ActiveRecord::Migration
  def change
    remove_column :jobs, :time, :time
  end
end
