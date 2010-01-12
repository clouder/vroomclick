class Car < ActiveRecord::Base
  has_many :images, :dependent => :destroy
  
  validates_presence_of :title
end
