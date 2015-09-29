class Story < ActiveRecord::Base
  has_many :conversations
  has_many :questions, through: :conversations

  has_many :topics
  has_many :concepts, through: :topics

  has_many :relationships
  has_many :characters, through: :relationships

end
