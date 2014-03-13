class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.references :resource_type, :null => false
      t.references :user, :null => false
      t.references :licence, :null => false

      t.string :name, :null => false
      t.string :description
      t.string :url, :null => false

      t.timestamps
    end

    add_index :resources, :resource_type_id
    add_index :resources, :user_id
    add_index :resources, :licence_id
  end
end
