class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = current_user
  end

  def update
    respond_to do |format|
      if current_user.update(user_params)
        redirect_to current_user
        flash[:message] = "Successfully updated your profile."
      else
        render :edit, status: :unprocessable_entity
        flash[:message] = "Try to update again."
      end
    end
  end

  private
    def user_params
      params.require(:user).permit(:email, :encrypted_password, :name, :admin)
    end
end
