class AddAvailableToTasks < ActiveRecord::Migration[7.0]
  def change
    add_column :tasks, :available, :boolean, default: true
  end
end
