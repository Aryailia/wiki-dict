require 'rails_helper'

RSpec.describe Lexeme, type: :model do
  describe 'validation' do
    # it { is_expected.to(validate_length_of(:password).is_at_least(5)) }
    # it { is_expected.to(validate_presence_of(:password_digest)) }
  end

  describe 'association' do
    it { is_expected.to have_many(:senses) }
  end

  describe '#approve' do
    before(:each) do
      @user = User.create!(email: 'example@quora.com', password: '123456')
      @question = @user.questions.create!(title: 'Something', description: 'Something')
      Vote.create!(user_id: @user.id, question_id: @question.id)
    end

    it "returns false if the user has not voted for the question" do
      user = User.create!(email: 'example2@quora.com', password: '123456')
      question = user.questions.create(title: 'Something else', description: 'Something else')
      expect(@user.voted_for_question?(question_id: question.id)).to eq false
    end
  end
end