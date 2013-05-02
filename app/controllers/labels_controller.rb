class LabelsController < ApplicationController
  before_filter :authenticate_user

  def create
    @label = @current_user.labels.build(params[:label])

    if @label.save
      redirect_to labels_url, notice: 'Novo label criado com sucesso!'
    else
      render action: 'new'
    end
  end

  def destroy
    @label = @current_user.labels.find(params[:id])

    @label.destroy
    redirect_to labels_url
  end

  def edit
    @label = @current_user.labels.find(params[:id])
  end

  def index
    @labels = @current_user.labels.order('created_at desc')
  end

  def new
    @label = @current_user.labels.build
  end

  def update
    @label = @current_user.labels.find(params[:id])

    if @label.update_attributes(params[:label])
      redirect_to labels_url, notice: 'Label editado com sucesso!'
    else
      render action: 'edit'
    end
  end
end
