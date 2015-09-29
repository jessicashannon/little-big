class Conversation < ActiveRecord::Base
  belongs_to :question
  belongs_to :story
end
