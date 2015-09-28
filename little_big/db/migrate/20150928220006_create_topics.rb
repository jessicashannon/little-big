class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.references :concept, index: true, foreign_key: true
      t.references :story, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
