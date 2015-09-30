class Story < ActiveRecord::Base
  has_many :conversations, dependent: :destroy
  has_many :questions, through: :conversations

  has_many :topics
  has_many :concepts, through: :topics

  has_many :relationships
  has_many :characters, through: :relationships

  def question_id=(q_id)
    self.questions << Question.find(q_id)
  end
end
