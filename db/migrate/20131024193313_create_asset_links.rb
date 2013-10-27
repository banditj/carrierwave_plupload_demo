class CreateAssetLinks < ActiveRecord::Migration
  def change
    create_table :asset_links do |t|
      t.integer :asset_id
      t.integer :linker_id
      t.string :linker_type
      t.string :linker_attr

      t.timestamps
    end
  end
end
