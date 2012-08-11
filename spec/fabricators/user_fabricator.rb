# == Schema Information
#
# Table name: users
#
#  id           :integer          not null, primary key
#  uid          :string(255)
#  name         :string(255)
#  image_url    :string(255)
#  twitter_name :string(255)
#  auth_token   :string(255)
#  auth_secret  :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

Fabricator(:user) do
  uid           { (1..8).collect { rand(10) }.join }
  twitter_name  { Faker::Name.first_name }
  name          { Faker::Name.name }
  auth_token    { (0...20).map{97.+(rand(25)).chr}.join }
  auth_secret   { (0...30).map{65.+(rand(25)).chr}.join }
  image_url     { Faker::Internet.domain_name }
end
