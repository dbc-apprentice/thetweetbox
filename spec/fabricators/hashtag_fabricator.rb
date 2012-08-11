# == Schema Information
#
# Table name: hashtags
#
#  id         :integer          not null, primary key
#  text       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

Fabricator(:hashtag) do
  tweet nil
  text  "MyString"
end
