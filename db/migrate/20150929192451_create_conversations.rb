class CreateConversations < ActiveRecord::Migration
  def change
    create_table :conversations do |t|
      t.references :question, index: true, foreign_key: true
      t.references :story, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
