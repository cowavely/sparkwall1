class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :header
      t.string :description
      t.string :image_url
      t.integer :user_id

      t.timestamps
    end
  end
end
