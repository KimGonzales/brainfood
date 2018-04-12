class Shelf < ActiveRecord::Base 
  belongs_to :user
  has_many :books

  def slug 
    self.name.downcase.gsub(" ","-")
  end

  def self.find_by_slug(slug)
    self.all.find{|shelf| shelf.slug = slug}
  end
end 