class AddReflectionToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :reflection, :text
  end
end
