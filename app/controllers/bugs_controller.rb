class BugsController < ApplicationController
  before_action :set_user, only: [:index, :show, :edit, :new, :create]

  before_action :require_user

  def index
    @bugs = Bug.all
  end

  def new
    @bug = Bug.new
  end

  def create
    @bug = Bug.new(bug_params)
    @bug.user = @user
    if @bug.save
      flash[:notice] = 'Thanks for preventing an infestation'
      redirect_to root_path
    else
      render :new
    end 
  end

private
  
  def set_user
    @user = current_user
  end

  def bug_params
    params.require(:bug).permit!
  end
end