class Secret < ApplicationRecord
  belongs_to :character

  validates_presence_of :content
end
