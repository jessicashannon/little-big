class Character < ActiveRecord::Base
  has_many :relationships
  has_many :stories, through: :relationships
end
