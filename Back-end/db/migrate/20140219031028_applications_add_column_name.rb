class ApplicationsAddColumnName < ActiveRecord::Migration
  def change
  	add_column :applications, :name, :string
  end
end
