class Book < ActiveRecord::Base

  belongs_to :shelf
  has_one :user, through: :shelf

  def slug
    self.title.downcase.gsub(" ", "-")
  end 

  def self.find_by_slug(slug)
    self.all.detect{|book| book.slug == slug}
  end
  
end