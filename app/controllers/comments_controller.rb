class CommentsController < ApplicationController
  before_action :require_user, only: [:new, :create]

  def create
    @todo = Todo.find(params[:todo_id])
    @comment = @todo.comments.build(params.require(:comment).permit(:body))
    @comment.user = current_user
  
    if @comment.save
      flash[:notice] = '增加成功'
      redirect_to todo_path(@todo)
    else
      render 'todos/show'
    end
  end
end