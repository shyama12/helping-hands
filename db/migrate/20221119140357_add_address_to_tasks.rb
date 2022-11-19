class AddAddressToTasks < ActiveRecord::Migration[7.0]
  def change
    add_column :tasks, :address, :string
  end
end
