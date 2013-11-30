class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    captcha_message = "The data you entered for the CAPTCHA wasn't correct.  Please try again"
    @user = User.new(user_params)
    if !verify_recaptcha(model: @user, message: captcha_message) || !@user.save
      render "new"
    end
  end

private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
