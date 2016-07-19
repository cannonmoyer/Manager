class RemoveSentDateColumnFromCancellation < ActiveRecord::Migration
  def change
  	remove_column :cancellations, :sent_date
  end
end
