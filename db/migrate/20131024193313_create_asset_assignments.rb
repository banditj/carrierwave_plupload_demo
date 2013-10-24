class CreateAssetAssignments < ActiveRecord::Migration
  def change
    create_table :asset_assignments do |t|
      t.integer :asset_id
      t.integer :link_id
      t.string :link_type
      t.string :usecase

      t.timestamps
    end
  end
end