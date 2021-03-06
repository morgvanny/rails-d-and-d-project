class CharactersController < ApplicationController

  def new
    @character = Character.new(user_id: params[:user_id])
    @parties = Party.all
    @secret = @character.secrets.build
  end

  def create
    filter
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
    filter
    @character = Character.find(params[:id])
    if @character.user_id == current_user.id
      if @character.update(character_params)
        redirect_to @character
      else
        binding.pry
        flash[:alert] = "Fields must be filled out correctly"
        render :edit
      end
    else
      flash[:alert] = "You can't edit someone else's character!"
      redirect_to root
    end
  end

  def leaderboard
    @characters = Character.leaderboard
  end

  def destroy
    @character = Character.find(params[:id])
    if @character.user_id == current_user.id
      @character.destroy
    else
      flash[:alert] = "You can't delete someone else's character!"
    end
    redirect_to user_path(current_user)
  end

  private

  def character_params
    params.require(:character).permit(:name, :level, :race, :character_class,
      :alignment, :strength, :dexterity, :constitution, :intelligence, :wisdom,
      :charisma, :hp, :ac, :initiative, :speed, :notes, :secret_password, :user_id, :party_id, secrets_attributes: [:id, :content])
  end

  def filter
    if params[:character][:secrets_attributes]["0"][:content] = ""
      params[:character].delete("secrets_attributes")
    end
  end

end
