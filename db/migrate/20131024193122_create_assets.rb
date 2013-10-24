class CreateAssets < ActiveRecord::Migration
  def change
    create_table :assets do |t|
      t.string :name
      t.string :image
      t.string :gallery_image
      t.string :video

      t.timestamps
    end
  end
end
