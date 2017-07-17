class Secret < ActiveRecord::Base
  belongs_to :character

  validates_presence_of :content
end
