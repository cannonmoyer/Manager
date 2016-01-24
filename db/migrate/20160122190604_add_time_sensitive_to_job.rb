class AddTimeSensitiveToJob < ActiveRecord::Migration
  def change
    add_column :jobs, :time_sensitive, :boolean
  end
end
