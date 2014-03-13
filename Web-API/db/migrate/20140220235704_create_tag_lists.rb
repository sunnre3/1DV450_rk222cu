class CreateTagLists < ActiveRecord::Migration
  def change
    create_table :tag_lists do |t|
    	t.references :tag
    	t.references :resource

      t.timestamps
    end
    
    add_index :tag_lists, :tag_id
    add_index :tag_lists, :resource_id
  end
end
