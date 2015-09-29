class DropQuestionIdFromStories < ActiveRecord::Migration
  def change
    remove_column :stories, :question_id
  end
end
