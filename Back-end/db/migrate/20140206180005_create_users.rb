class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|

    	t.string :firstname
    	t.string :surname
    	t.string :email

      t.timestamps
    end
  end
end
