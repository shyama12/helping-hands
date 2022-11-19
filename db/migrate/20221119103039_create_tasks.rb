class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.datetime :date_time
      t.references :category, null: false, foreign_key: true
      t.text :description
      t.references :user, null: false, foreign_key: true
      t.boolean :need_help

      t.timestamps
    end
  end
end
