class ChangeLandlineMonitoringToInteger < ActiveRecord::Migration
  def change
  		change_column :cancellations, :landline_monitoring,  :integer
  end
end
