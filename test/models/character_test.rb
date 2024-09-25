require 'test_helper'

class CharacterTest < ActiveSupport::TestCase
  def setup
    @user = users(:one)
    @party = parties(:one)
    @character = Character.new(
      name: "Test Character",
      level: 1,
      race: "Human",
      character_class: "Fighter",
      alignment: "Neutral Good",
      strength: 10,
      dexterity: 10,
      constitution: 10,
      intelligence: 10,
      wisdom: 10,
      charisma: 10,
      hp: 10,
      ac: 10,
      initiative: 0,
      speed: 30,
      user: @user,
      party: @party
    )
  end

  test "should be valid" do
    assert @character.valid?
  end

  test "name should be present" do
    @character.name = "     "
    assert_not @character.valid?
  end

  test "level should be between 1 and 20" do
    @character.level = 0
    assert_not @character.valid?
    @character.level = 21
    assert_not @character.valid?
    @character.level = 1
    assert @character.valid?
    @character.level = 20
    assert @character.valid?
  end

  test "ability scores should be between 0 and 20" do
    @character.strength = -1
    assert_not @character.valid?
    @character.strength = 21
    assert_not @character.valid?
    @character.strength = 0
    assert @character.valid?
    @character.strength = 20
    assert @character.valid?
  end

  test "should belong to a user" do
    @character.user = nil
    assert_not @character.valid?
  end
end
