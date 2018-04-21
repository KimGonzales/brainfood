class Shelf < ActiveRecord::Base 
  belongs_to :user
  has_many :books
  validates_presence_of :name
  validates_associated :books
end 