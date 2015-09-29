class Topic < ActiveRecord::Base
  belongs_to :concept
  belongs_to :story
end
