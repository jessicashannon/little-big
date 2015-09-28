class Question < ActiveRecord::Base
  has_many :stories
  has_many :characters, through: :stories
  has_many :concepts, through: :stories
end
