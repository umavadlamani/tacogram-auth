class SessionsController < ApplicationController
  def new
  end
  
  def create
    # TODO: authenticate user
    # 1. try to find the user by their unique identifier
    @user = User.find_by({"email" => params["email"]})
    # 2. if the user exists -> check if they know their password
    if @user != nil
        # 2b. if they know their password -> login is successful
        if BCrypt::Password.new(@user["password"]) == params["password"]
          session["user_id"] = @user["id"]
          flash["notice"] = "Welcome, #{@user["first_name"]}."
          redirect_to "/posts"
        # 2c. if the user doesn't know their password -> login fails
        else
          flash["notice"] = "Wrong Password, Try Again!"
          redirect_to "/login"
        end
    # 4a. if the user doesn't exist -> login fails
    else
      flash["notice"] = "User Doesn't Exist, Please Sign Up!"
      redirect_to "/users/new"
    end  
  end

  def destroy
    # logout the user
    flash["notice"] = "Goodbye."
    session["user_id"] = nil
    redirect_to "/login"
  end

end
