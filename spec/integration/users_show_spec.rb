require 'spec_helper'

describe 'users show' do
  it 'users show page should have the user twitter name, image, and tweets' do
   user = Fabricate(:user)
   visit "/#{user.twitter_name}"
   page.has_content?(user.twitter_name)
   page.should have_xpath("//img[@src=#{user.image_url}]")
  end
end