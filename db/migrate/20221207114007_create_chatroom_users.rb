class CreateChatroomUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :chatroom_users do |t|
      t.references :chatroom, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.integer :subscribed, default: 0
      t.integer :new_messages, default: 0

      t.timestamps
    end
  end
end
