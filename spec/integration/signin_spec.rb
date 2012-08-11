require 'spec_helper'

describe 'user creation' do
  it 'allows a user to sign in via twitter' do
   visit '/users/new'
   page.should have_link 'Sign In With Twitter'
  end
end