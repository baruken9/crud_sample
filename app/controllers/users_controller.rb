class UsersController < ApplicationController
  def index
    @users = User.all
  end
  #newアクション
  def new
    @user = User.new
  end
  #createアクション
  def create
    #Strong Paramenterの記述
    User.create(user_params)
    redirect_to :action => "index"
  end
  #editアクション
  def edit
    @user = User.find(params[:id])
  end
  #updateアクション
  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to :action => "index"
  end
  #deleteアクション
  def destroy
    user = User.find(params[:id])
    user.delete
    redirect_to :action => "index"
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :age)
  end
end
