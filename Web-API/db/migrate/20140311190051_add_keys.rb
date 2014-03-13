class AddKeys < ActiveRecord::Migration
  def change
    add_foreign_key "resources", "licences", name: "resources_licence_id_fk"
    add_foreign_key "resources", "resource_types", name: "resources_resource_type_id_fk"
    add_foreign_key "resources", "users", name: "resources_user_id_fk"
    add_foreign_key "tag_lists", "resources", name: "tag_lists_resource_id_fk"
    add_foreign_key "tag_lists", "tags", name: "tag_lists_tag_id_fk"
  end
end
