class User < ActiveRecord::Base 
  has_secure_password
  has_many :shelves
  has_many :books, through: :shelves
  validates_presence_of :username, :email, :password

  def slug 
    self.username.downcase.gsub(" ","-")
  end

  def self.find_by_slug(slug)
    self.all.find {|user|user.slug == slug} 
  end 

  def name
    self.username.capitalize
  end

end 