class Sense < ApplicationRecord
  belongs_to :lexeme
  validates :word_class, :presence => true
  validates :content, :presence => true
  
end
