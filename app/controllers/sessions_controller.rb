class SessionsController < ApplicationController
  before_filter :save_login_state, except: [:logout]

  def login
  end

  def login_attempt
    authorized_user = User.authenticate(params[:email],params[:password])
    if authorized_user
      session[:user_id] = authorized_user.id
      redirect_to root_url
    else
      flash[:alert] = 'Email ou senha incorretos'
      render action: 'login'
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to action: 'login'
  end
end
