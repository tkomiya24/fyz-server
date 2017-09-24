class UsersController < ApplicationController
  def create
    user = User.new(create_parameters)
    if user.save
      render(json: user)
    else
      render(json: user.errors, status: :bad_request)
    end
  end

  private

  def create_parameters
    params.require(:user).permit([:username, :password, :password_confirmation])
  end
end
