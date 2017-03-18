# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  name       :text
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Post < ApplicationRecord
  has_many :comments
  belongs_to :user
end
