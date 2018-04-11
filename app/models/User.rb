class User < ActiveRecord::Base 
  has_many :shelves
  has_many :books, through: :shelves

  def slug 
    self.username.downcase.gsub(" ","-")
  end 

end 