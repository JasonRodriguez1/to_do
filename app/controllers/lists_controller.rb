class ListsController < ApplicationController

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
    @task = Task.new(:list_id => params[:id])
  end

  def new
    @list = List.new(:name => params[:id])
  end

  def create
    @list = List.new(list_params)
    if @list.save
      flash[:notice] = "Your list has been saved."
    redirect_to @list
    else
     render :new
    end
  end

  def edit
    @list = List.find(params[:id])
  end   

  def update
    @list = List.find(params[:id])
    if @list.update(list_params)
     flash[:notice] = "list updated"
     redirect_to @list
    else
      render :edit
    end
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    flash[:notice] = "list deleted"
    redirect_to lists_path
  end  
       


  private

  def list_params
    params.require(:list).permit(:name)
  end    
end    
