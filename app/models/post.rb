# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#  image      :string
#

class Post < ApplicationRecord
  belongs_to :user
  validates_presence_of :title
  validates_uniqueness_of :title, scope: :user
  validates_length_of :title, {minimum: 3}
  validates_presence_of :body, if: lambda { |post| post.title.length > 10 }
  validates_presence_of :user

  mount_uploader :image, PostImageUploader


  scope :admin_posts, -> { where(user_id: 1) }
end
