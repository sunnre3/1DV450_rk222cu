class CreateApplications < ActiveRecord::Migration
  def change
    create_table :applications do |t|

    	t.string :contact_email, :null => false
    	t.string :name, :null => false

      t.timestamps
    end
  end
end
