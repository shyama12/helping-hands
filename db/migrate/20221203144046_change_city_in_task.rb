class ChangeCityInTask < ActiveRecord::Migration[7.0]
  def change
    change_column :tasks, :city, :string
  end
end
