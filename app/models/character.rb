class Character < ActiveRecord::Base
  belongs_to :user
  belongs_to :party
  has_many :secrets

  validates_presence_of :name, :level, :race, :character_class, :alignment, :strength,
    :dexterity, :constitution, :intelligence, :wisdom, :charisma, :hp, :ac,
    :initiative, :speed, :user_id

  validates :strength, :dexterity, :constitution, :intelligence, :wisdom, :charisma,
    inclusion: { in: 0..20 }
  validates :level, inclusion: { in: 1..20 }

  def self.leaderboard
    Character.all.order(level: :desc)
  end

  def secrets_attributes=(secrets_attributes)
    secrets_attributes.values.each do |secret_attributes|
      self.secrets.build(secret_attributes)
    end
  end

end
