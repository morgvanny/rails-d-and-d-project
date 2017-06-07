class Character < ActiveRecord::Base
  belongs_to :user
  belongs_to :party

  validates_presence_of :name, :level, :race, :character_class, :alignment, :strength,
    :dexterity, :constitution, :intelligence, :wisdom, :charisma, :hp, :ac,
    :initiative, :speed, :user_id

  validates :alignment, inclusion: { in: %w(Lawful Good Neutral Good Chaotic Good
    Lawful Neutral Neutral Chaotic Neutral Lawful Evil Neutral Evil Chaotic Evil)}
  validates :strength, :dexterity, :constitution, :intelligence, :wisdom, :charisma,
    inclusion: { in: [0,20] }
  validates :level, inclusion: { in: [1,20] }

end
