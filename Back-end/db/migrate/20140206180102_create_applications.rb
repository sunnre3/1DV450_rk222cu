class CreateApplications < ActiveRecord::Migration
  def change
    create_table :applications do |t|

    	t.string :contact_email

      t.timestamps
    end
  end
end
