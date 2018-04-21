class Book < ActiveRecord::Base
  belongs_to :shelf
  has_one :user, through: :shelf 
  validates_presence_of :title, :author, :quote
end