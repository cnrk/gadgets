class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :image
      t.string :file
      t.integer :gadget_id
    end
  end
end
