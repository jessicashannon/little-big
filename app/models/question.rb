class Question < ActiveRecord::Base
  has_many :stories
  has_many :characters, through: :stories
  has_many :concepts, through: :stories

  has_many :conversations
  has_many :stories, through: :conversations

end
