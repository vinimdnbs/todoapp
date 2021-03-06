class TasksController < ApplicationController
  before_filter :authenticate_user

  def create
    @task = @current_user.tasks.build(params[:task])

    if @task.save
      redirect_to tasks_url, notice: 'Nova tarefa criada com sucesso!'
    else
      @labels = @current_user.labels.order('name')
      render action: 'new'
    end
  end

  def destroy
    @task = @current_user.tasks.find(params[:id])

    @task.destroy
    redirect_to tasks_url
  end

  def edit
    @labels = @current_user.labels.order('name')
    @task = @current_user.tasks.find(params[:id])
  end

  def index
    @labels = @current_user.labels.order('name')

    unless params[:filter].blank?
      @tasks_no_filter = @current_user.tasks
      @tasks = Array.new
      @tasks_no_filter.each do |t|
        if t.label_id == params[:filter].to_i
          @tasks << t
        end
      end
    else
      @tasks = @current_user.tasks.order('created_at desc')
    end
  end

  def new
    @labels = @current_user.labels.order('name')
    @task = @current_user.tasks.build
  end

  def show
    @task = @current_user.tasks.find(params[:id])
  end

  def update
    @task = @current_user.tasks.find(params[:id])

    @task.status = params[:status] == '1'

    if @task.update_attributes(params[:task])
      redirect_to tasks_url, notice: 'Tarefa editada com sucesso!'
    else
      @labels = @current_user.labels.order('name')
      render action: 'edit'
    end
  end
end
