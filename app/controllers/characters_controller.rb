class CharactersController < ApplicationController

  def new
    @character = Character.new(user_id: params[:user_id])
  end

  def create
    @character = current_user.characters.build(character_params)
    if @character.save
      redirect_to @character
    else
      flash[:alert] = "Fields must be filled out correctly"
      render :new
    end
  end

  def show
    @character = Character.find(params[:id])
  end

  def edit
    @character = Character.find(params[:id])
  end

  def update
    @character = Character.find(params[:id])
    if @character.update(character_params)
      redirect_to @character
    else
      flash[:alert] = "Fields must be filled out correctly"
      render :edit
    end
  end

  def destroy
    @character = Character.find(params[:id])
    @character.destroy
    redirect_to user_path(current_user)
  end

  private

  def character_params
    params.require(:character).permit(:name, :level, :race, :character_class,
      :alignment, :strength, :dexterity, :constitution, :intelligence, :wisdom,
      :charisma, :hp, :ac, :initiative, :speed, :notes, :user_id, :party_id)
    end

end
