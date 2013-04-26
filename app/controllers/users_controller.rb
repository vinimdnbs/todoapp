#encoding=UTF-8
class UsersController < ApplicationController
  def create
    @user = User.new(params[:user])

    if @user.save
      flash[:notice] = 'Seu cadastro foi concluído! Experimente o login com a sua nova conta.'
      redirect_to controller: 'sessions', action: 'login'
    else
      render 'new'
    end
  end

  def new
    @user = User.new
  end
end
