class Image < ActiveRecord::Base
  has_attached_file :image
  belongs_to :car
  
  validates_attachment_presence :image
  validates_attachment_content_type :image, :content_type => /image\//
end
