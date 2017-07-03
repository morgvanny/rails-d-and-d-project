class UsersController < ApplicationController

  def show
    @parties = current_user.parties
    @characters = current_user.characters
  end

end
