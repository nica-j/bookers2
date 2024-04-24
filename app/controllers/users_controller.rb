class UsersController < ApplicationController
  def show
    
  end

  def index
    
    
  end

  def edit
  end
  
  def user_params
    params.require(:user).permit(:name, :introduction, :image)  
  end
end
