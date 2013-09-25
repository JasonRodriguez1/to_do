class TasksController < ApplicationController
  # def index
  #   @tasks = Task.all
  # end

  def show
    @task = Task.find(params[:id])
  end   

  def new
    @task = Task.new(:list_id => params[:list_id])
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      flash[:notice] = "Your task has been saved."
    redirect_to @task.list
    else
     render :new
    end
  end

  def edit
    @task = Task.find(params[:id])
  end   

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
     flash[:notice] = "Task updated"
     redirect_to @task
    else
      render :edit
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    flash[:notice] = "Task deleted"
    redirect_to @task.list
  end  
       


  private

  def task_params
    params.require(:task).permit(:description, :duedate, :completed, :list_id)
  end    
end    