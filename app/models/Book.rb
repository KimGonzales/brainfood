class Book < ActiveRecord::Base
  belongs_to :shelf 
  has_one :user, through: :shelf 
end 