class TodosController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :complete]
  before_action :set_user, only: [:index, :show, :edit, :new, :create, :complete]

  before_action :require_user, except: [:index]


  def index
    @todos = @user.todos.all if @user
  end

  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(todo_params)
    @todo.user = current_user
    if @todo.save
      flash[:notice] = "ToDo added!"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
    @comment = Comment.new
  end

  def edit
  end

  def update
    if @todo.update(todo_params)
      flash[:notice] = 'Todo updated'
      redirect_to root_path
    else
      render :edit
    end
  end

  def complete
    flash[:notice] = 'Todo completed!'
    @todo.done = true
    @todo.save
    redirect_to root_path
  end

  def destroy
    @todo = Todo.find(params[:id])
    @todo.delete
    redirect_to todos_path
  end

  private
  
  def set_user
    @user = current_user
  end

  def set_post
    if current_user
      begin
      @todo = current_user.todos.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        flash[:error] = "The todo you're looking for could not be found."
        redirect_to root_path
      end
    else
      flash[:error] = 'You must be logged in to do that'
      redirect_to root_path
    end
  end

  def todo_params
    params.require(:todo).permit!
  end

end