class CreateExperiences < ActiveRecord::Migration[7.0]
  def change
    create_table :experiences do |t|
      t.text :comment
      t.boolean :friendship_bracelet, default: false
      t.references :task_application, null: false, foreign_key: true

      t.timestamps
    end
  end
end
