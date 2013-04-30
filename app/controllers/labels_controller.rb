class LabelsController < ApplicationController
  before_filter :authenticate_user

  def create
    @label = Label.new(params[:label])

    if @label.save
      redirect_to labels_url, notice: 'Novo label criado com sucesso!'
    else
      render action: 'new'
    end
  end

  def destroy
    @label = Label.find(params[:id])

    @label.destroy
    redirect_to labels_url
  end

  def edit
    @label = Label.find(params[:id])
  end

  def index
    @labels = Label.order('created_at desc')
  end

  def new
    @label = Label.new
  end

  def update
    @label = Label.find(params[:id])

    if @label.update_attributes(params[:label])
      redirect_to labels_url, notice: 'Label editado com sucesso!'
    else
      render action: 'edit'
    end
  end
end
