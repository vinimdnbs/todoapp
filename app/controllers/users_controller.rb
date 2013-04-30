#encoding=UTF-8
class UsersController < ApplicationController
  before_filter :authenticate_user, only:[:edit, :update]

  def create
    @user = User.new(params[:user])

    if @user.save
      flash[:notice] = 'Seu cadastro foi concluído! Experimente o login com a sua nova conta.'
      redirect_to controller: 'sessions', action: 'login'
    else
      render action: 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(params[:user])
      redirect_to edit_user_url, notice: 'Senha alterada com sucesso'
    else
      render action: 'edit'
    end
  end
end
