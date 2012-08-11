# == Schema Information
#
# Table name: tweets
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  text       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  twitter_id :integer
#

Fabricator(:tweet) do
  user nil
  text "MyString"
end
