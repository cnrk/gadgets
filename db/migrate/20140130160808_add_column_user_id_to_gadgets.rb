class AddColumnUserIdToGadgets < ActiveRecord::Migration
  def change
    add_column :gadgets, :user_id, :integer
  end
end
