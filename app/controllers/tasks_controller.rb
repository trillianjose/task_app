class TasksController < ApplicationController
  before_action :find_task, only: [:edit, :update, :destroy, :completed]

  def index
    @tasks = Task.order(created_at: :asc)
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to tasks_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to tasks_path
    else
      render :edit
    end
  end

  def destroy
    @task.destroy

    redirect_to tasks_path
  end

  def completed
    @task.toggle!(:done)

    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:description)
  end

  def find_task
    @task = Task.find(params[:id])
  end
end
