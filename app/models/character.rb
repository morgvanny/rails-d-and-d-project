class Character < ActiveRecord::Base
  belongs_to :user
  belongs_to :party

  validates_presence_of :name, :level, :race, :character_class, :alignment, :strength,
    :dexterity, :constitution, :intelligence, :wisdom, :charisma, :hp, :ac,
    :initiative, :speed, :user_id

  validates :strength, :dexterity, :constitution, :intelligence, :wisdom, :charisma, :speed,
    inclusion: { in: 0..20 }
  validates :level, inclusion: { in: 1..20 }

end
