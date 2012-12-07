class AddFieldsToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :body, :text
    add_column :projects, :name, :string
    add_column :projects, :location, :string
    add_column :projects, :video, :text
    add_column :projects, :excerpt, :string
    add_column :projects, :goal, :decimal, precision: 15, scale: 2, default: 0.0
    add_column :projects, :expires_at, :date
    add_column :projects, :published, :boolean, default: true
    add_column :projects, :featured, :boolean, default: false
  end
end
