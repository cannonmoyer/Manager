class ChangeCellMonitoringToInteger < ActiveRecord::Migration
  def change
  	change_column :cancellations, :cell_monitoring,  :integer
  end
end
