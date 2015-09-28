class Story < ActiveRecord::Base
  belongs_to :question
  has_many :topics
  has_many :concepts, through: :topics
  has_many :relationships
  has_many :characters, through: :relationships
end
