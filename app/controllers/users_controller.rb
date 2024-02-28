class UsersController < ApplicationController
  def new
  end

  def create
    if User.find_by({"email" => params["email"]}) == nil
      @user = User.new
      @user["first_name"] = params["first_name"]
      @user["last_name"] = params["last_name"]
      @user["email"] = params["email"]
      # TODO: encrypt user's password "at rest"
      @user["password"] = BCrypt::Password.create(params["password"])
      @user.save
      redirect_to "/posts"
    else
      flash["notice"] = "User with this email already exists. Please Log In"
      redirect_to "/login"
    end
  end
end
