class TodosController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :complete, :not_complete, :pinned, :unpin]
  before_action :set_user, only: [:index, :show, :edit, :new, :create, :complete, :not_complete, :completed, :pinned, :unpin]

  before_action :require_user, except: [:index]


  def index
    @todos = @user.todos.all if @user
  end

  def completed
    @todos = @user.todos.all
  end

  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(todo_params)
    @todo.user = current_user
    if @todo.save
      flash[:notice] = "已添加!"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
    @comment = Comment.new
  end
def
   edit
  end

  def update
    if @todo.update(todo_params)
      flash[:notice] = '已修改'
      redirect_to root_path
    else
      render :edit
    end
  end

  def complete
    flash[:notice] = '已标注为完成!'
    @todo.update_attribute(:done, true)
    redirect_to root_path
  end

  def not_complete
    flash[:notice] = '已标注为未完成，请继续!'
    @todo.update_attribute(:done, false)
    redirect_to root_path    
  end

  def pinned
    flash[:notice] = '已置顶'
    @todo.update_attribute(:time_pinned, Time.now)
    redirect_to root_path
  end

  def unpin
    flash[:notice] = '取消置顶'
    @todo.update_attribute(:time_pinned, nil)
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
        flash[:error] = "找不到这个项目"
        redirect_to root_path
      end
    else
      flash[:error] = '你必须先登录'
      redirect_to root_path
    end
  end

  def todo_params
    params.require(:todo).permit!
  end

end