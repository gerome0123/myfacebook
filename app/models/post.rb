class Post < ApplicationRecord
  #acts_as_likeable
  acts_as_votable
  belongs_to :user
  has_many :commenters, dependent: :destroy
  has_many :users, :through => :commenters
  has_attached_file :avatar
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

end