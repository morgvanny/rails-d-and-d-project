class UsersController < ApplicationController

  def show
    @parties = current_user.parties.all
    @characters = current_user.characters.all
  end

end
