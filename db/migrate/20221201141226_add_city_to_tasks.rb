class AddCityToTasks < ActiveRecord::Migration[7.0]
  def change
    add_column :tasks, :city, :text
  end
end
