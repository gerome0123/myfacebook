class Profile < ApplicationRecord
  belongs_to :user, :dependent => :destroy
  has_attached_file :avatar,:default_url => ActionController::Base.helpers.asset_path('assetsmissing.png')
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  validates :firstname, :lastname, presence: true
  validates_format_of :firstname, :with => /\A[^0-9`!@#\$%\^&*+_=]+\z/
  validates_format_of :lastname, :with => /\A[^0-9`!@#\$%\^&*+_=]+\z/


#def self.search(search)
#  where("firstname LIKE ? OR lastname LIKE ? ", "%#{search}%", "%#{search}%") 
 
#end

#def full_name
#{}"#{self.firstname} #{self.lastname}"
#end


#def self.search_by_full_name(search)
#	where("CONCAT_WS(' ', firstname, lastname) LIKE ?", "%#{search}%")
#end





def self.search_by_full_name(search)
 @names = search.split(" ")
 where("firstname LIKE ? AND lastname LIKE ?", "%#{@names[0]}","%#{@names[1]}" )
end

def self.lastname(search)
  where("lastname LIKE ? ", "%#{search}%") 
end

end
