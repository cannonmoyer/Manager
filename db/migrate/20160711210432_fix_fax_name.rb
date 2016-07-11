class FixFaxName < ActiveRecord::Migration
  def change
  	rename_column :certificates, :fax, :to
  end
end
