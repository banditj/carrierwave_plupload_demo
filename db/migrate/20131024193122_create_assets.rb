class CreateAssets < ActiveRecord::Migration
  def change
    create_table :assets do |t|
      t.string :name
      t.string :file
      t.string :type

      t.timestamps
    end
  end
end
