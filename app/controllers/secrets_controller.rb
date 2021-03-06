class SecretsController < ApplicationController
  before_action :set_character, :get_permission

  def index
    password_mismatch
    @secrets = @character.secrets
  end

  def new
    @secret = Secret.new
  end

  def create
    @secret = @character.secrets.build(secret_params)
    if @secret.save
      redirect_to character_secrets_path(@character)
    else
      flash[:alert] = "Fields must be filled out correctly"
      render :new
    end
  end

  def edit
    @secret = Secret.find(params[:id])
  end

  def update
    @secret = Secret.find(params[:id])
    if @secret.update(secret_params)
      redirect_to character_secrets_path(@character)
    else
      flash[:alert] = "Fields must be filled out correctly"
      render :edit
    end
  end

  def destroy
    @secret = Secret.find(params[:id])
    @secret.destroy
    redirect_to character_secrets_path(@character)
  end

  private
    def set_character
      @character = Character.find(params[:character_id])
    end

    def secret_params
      params.require(:secret).permit(:content)
    end

    def password_mismatch
      if params[:secret_password] != @character.secret_password && session[@character.id] != true
        flash[:alert] = "Try again!"
        redirect_to character_path(@character)
      else
        session[@character.id] = true
      end
    end

    def get_permission
      if @character.user_id != current_user.id
        flash[:alert] = "These secrets aren't for you!"
        redirect_to root_path
      end
    end

end
