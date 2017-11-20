class Lexeme < ApplicationRecord
  has_many(:senses)

  WORD_CLASS_PAIRS = [
    [:Noun, 0],
    [:Verb, 1],
    [:Adjective, 2],
    [:Adverb, 3],
    [:Particle, 4],
    [:Expression, 5],
  ].freeze

  WORD_CLASSES = WORD_CLASS_PAIRS.map { |x| x[0] }.freeze
end
