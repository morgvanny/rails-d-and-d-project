require 'test_helper'

class CharactersControllerTest < ActionController::TestCase
  include Devise::Test::ControllerHelpers

  def setup
    @user = users(:one)
    @character = characters(:one)
    sign_in @user
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create character" do
    assert_difference('Character.count') do
      post :create, params: { character: { 
        name: "New Character",
        level: 1,
        race: "Elf",
        character_class: "Wizard",
        alignment: "Chaotic Good",
        strength: 8,
        dexterity: 14,
        constitution: 10,
        intelligence: 16,
        wisdom: 12,
        charisma: 10,
        hp: 6,
        ac: 12,
        initiative: 2,
        speed: 30,
        user_id: @user.id,
        party_id: parties(:one).id
      } }
    end

    assert_redirected_to character_path(Character.last)
  end

  test "should show character" do
    get :show, params: { id: @character.id }
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: { id: @character.id }
    assert_response :success
  end

  test "should update character" do
    patch :update, params: { id: @character.id, character: { name: "Updated Name" } }
    assert_redirected_to character_path(@character)
    @character.reload
    assert_equal "Updated Name", @character.name
  end

  test "should destroy character" do
    assert_difference('Character.count', -1) do
      delete :destroy, params: { id: @character.id }
    end

    assert_redirected_to user_path(@user)
  end

  test "should get all characters" do
    get :all
    assert_response :success
    assert_not_nil assigns(:characters)
  end
end