class TasksController < ApplicationController
  before_filter :authenticate_user

  def create
    @task = Task.new(params[:task])

    if @task.save
      redirect_to tasks_url, notice: 'Nova tarefa criada com sucesso!'
    else
      @labels = Label.order('name')
      render action: 'new'
    end
  end

  def destroy
    @task = Task.find(params[:id])

    @task.destroy
    redirect_to tasks_url
  end

  def edit
    @labels = Label.order('name')
    @task = Task.find(params[:id])
  end

  def index
    @labels = Label.all
    @tasks = Task.order('created_at desc')
  end

  def new
    @labels = Label.order('name')
    @task = Task.new
  end

  def show
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])

    @task.status = params[:status] == '1'

    if @task.update_attributes(params[:task])
      redirect_to tasks_url, notice: 'Tarefa editada com sucesso!'
    else
      @labels = Label.order('name')
      render action: 'edit'
    end
  end
end
