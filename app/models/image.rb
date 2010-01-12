class Image < ActiveRecord::Base
  has_attached_file :image, :styles => {:original => '600x400#', :thumbnail => '105x70#'}
  belongs_to :car
  
  validates_attachment_presence :image
  validates_attachment_content_type :image, :content_type => /image\//
end
