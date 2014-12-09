class TasksController < ApplicationController
	http_basic_authenticate_with name: "test", password: "passw", only: :destroy	
	 
	def edit
	    @task = Task.find(params[:id])
	    @list = List.find(params[:list_id])
	end	
	def create
	    @list = List.find(params[:list_id])
	    @task = @list.tasks.create(task_params)
	    redirect_to lists_path
	end
	def update
	    @list = List.find(params[:list_id])
	    @task = Task.find(params[:id])
 	 if @task.update(task_params)
   	 redirect_to lists_path
  	 else
    	 render 'edit'
  	 end
	end
	def destroy
	    @list = List.find(params[:list_id])
	    @task = Task.find(params[:id])
	    @task.destroy
	    redirect_to lists_path
	end
  private
    def task_params
      params.require(:task).permit(:task)
    end
end
