class UsersController < ApplicationController
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.password == @user.password_confirmation
      @user.save
      redirect_to root_path
    else
      flash[:notice] = "Password is not the same"
      redirect_to new_user_path
    end
  end

  def edit
    @user = User.find_by_id cookies[:user_id]
  end

  def update
    @user = User.find_by_id cookies[:user_id]
    if @user.update user_params
      flash[:notice] = "sucessfully updated"
      redirect_to posts_path
    end
  end

  def edit_password
    @user = User.find_by_id cookies[:user_id]
  end

  def update_password
    @user = User.find_by_id cookies[:user_id]
    if @user&.authenticate params[:user][:current_password]
      new_password = params[:user][:new_password]
      new_password_confirmation = params[:user][:new_password_confirmation]
      if new_password == new_password_confirmation
        if @user.update password: new_password, password_confirmation: new_password_confirmation
          flash[:alert] = "password updated!"
          redirect_to root_path, status: 303
        else
          flash[:alert] = "password update failed"
          render :edit_password, status: 303
        end
      else
        flash[:alert] = "Old password does not match"
        render :edit_password, status: 303
      end
      
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
