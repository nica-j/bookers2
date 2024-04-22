class UsersController < ApplicationController
  def show
  end

  def index
    @user = User.find(params[:id])
    
  end

  def edit
  end
  
  def user_params
    params.require(:user).permit(:name, :introduction, :image)  
  end
end
