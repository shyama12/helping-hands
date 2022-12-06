class AddCityToTasks < ActiveRecord::Migration[7.0]
  def add
    add_column :tasks, :city, :text
  end
end
