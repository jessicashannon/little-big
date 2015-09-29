class Concept < ActiveRecord::Base
  has_many :topics
  has_many :stories, through: :topics  
end
