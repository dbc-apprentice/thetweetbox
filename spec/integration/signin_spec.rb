require 'spec_helper'

describe 'user creation' do
  it 'allows a user to sign in via twitter' do
   visit '/users/sign_in'
   page.should have_button 'Sign In With Twitter'
  end
end