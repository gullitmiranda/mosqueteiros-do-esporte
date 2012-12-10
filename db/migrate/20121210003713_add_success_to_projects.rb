class AddSuccessToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :success, :boolean, default: false
  end
end
