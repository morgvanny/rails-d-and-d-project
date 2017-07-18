class Secret < ActiveRecord::Base
  belongs_to :character

  validates_presence_of :content

  def next
    character.secrets.where("id > ?", id).first
  end

  def previous
    character.secrets.where("id < ?", id).last
  end
end
