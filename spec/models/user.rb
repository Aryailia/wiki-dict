require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = User.create!(email: 'example@jisho.com', password: '123456', level: 1)
  end

  describe('Password working') do
    it { expect(@user.authenticate(@user.password)).to(eq(true)) }
  end

  describe('validation') do
		# it { is_expected.to(validate_presence_of(:email)) }
		# it { is_expected.to(validate_presence_of(:password_digest)) }
    describe('uniqueness') do
      before do
        @user.dup.save
      end
			it { should_not(be_valid) }
    end
  end

  describe 'association' do
  end
end