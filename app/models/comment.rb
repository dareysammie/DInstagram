class Comment < ApplicationRecord
  belongs_to :pic
  belongs_to :user

  

  validates_length_of :content, :minimum => 1
  
end
