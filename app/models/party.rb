class Party < ActiveRecord::Base
  has_many :characters

  validates_uniqueness_of :name
end
