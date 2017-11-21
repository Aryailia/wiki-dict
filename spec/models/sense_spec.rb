require 'rails_helper'

RSpec.describe Sense, type: :model do
	describe 'validations' do
		it { is_expected.to validate_presence_of(:content) }
		it { is_expected.to validate_presence_of(:word_class) }
	end

	describe 'associations' do
		it { is_expected.to(belong_to(:lexeme)) }
	end
end