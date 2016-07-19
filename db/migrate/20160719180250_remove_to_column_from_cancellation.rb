class RemoveToColumnFromCancellation < ActiveRecord::Migration
  def change
  	remove_column :cancellations, :to
  end
end
