class PartiesController < ApplicationController
  def index
    @parties = Party.all
  end

  def new
    @party = Party.new
  end

  def create
    @party = current_user.parties.build(party_params)
    if @party.save!
      redirect_to @party
    else
      flash[:alert] = "Fields must be filled out correctly"
      render :new
    end
  end

  def show
    @party = Party.find(params[:id])
  end

  def join
    @party = Party.find(params[:id])
  end

  private

  def party_params
    params.require(:party).permit(:name, :user_id)
  end
end
