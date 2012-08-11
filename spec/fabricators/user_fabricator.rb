Fabricator(:user) do
  uid           { (1..8).collect { rand(10) }.join }
  twitter_name  { Faker::Name.first_name }
  name          { Faker::Name.name }
  auth_token    { (0...20).map{97.+(rand(25)).chr}.join }
  auth_secret   { (0...30).map{65.+(rand(25)).chr}.join }
  image_url     { Faker::Internet.domain_name }
end
