require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = User.create!(email: 'example@jisho.com', password: '123456', level: 1)
  end

  describe('Password working') do
    it { expect(@user.authenticate(@user.password).password_digest).to(eq(@user.password_digest)) }
  end

  describe('validation') do
		it { is_expected.to(validate_presence_of(:email)) }
		it { is_expected.to(validate_presence_of(:password_digest)) }
		it { is_expected.to(validate_presence_of(:level)) }
		it { is_expected.to(validate_uniqueness_of(:email)) }
    # describe('uniqueness') do
    #   before do
    #     @user.dup.save
    #   end
		# 	it { should_not(be_valid) }
    # end
  end

  describe 'association' do
  end
end