class Secret < ActiveRecord::Base
  belongs_to :character

  validates_presence_of :content

  def next
    character.secrets.where("id > ?", id).first
  end

  def next_id
    if self.next != nil
      self.next.id
    end
  end

  def previous
    character.secrets.where("id < ?", id).last
  end

  def previous_id
    if self.previous != nil
      self.previous.id
    end
  end

end
