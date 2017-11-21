require 'rails_helper'

RSpec.feature("Routes", type: :feature) do
  describe('sign in') do
  	before(:each) do
  		User.create(email: 'kevin@example.com', password: '1234567')
  	end

  	it('signs me in and show homepage title') do
  		visit('/login')
  		within('form[action="/login"]') do
  			find('#session_email').set('kevin@example.com')
				find('#session_password').set('1234567')
  		end
  		click_button('Login')
  		expect(page).to(have_content "New Lexeme")
  	end
  end
end