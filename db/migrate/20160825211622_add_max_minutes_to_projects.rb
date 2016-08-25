class AddMaxMinutesToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :max_minutes, :integer
  end
end
