class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update]
  before_action :set_user, only: [:create, :show, :edit, :update, :new] # TODO - Decide which are needed

  before_action :require_user, except: [:index]

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(cat_params)

    if @category.save
      flash[:notice] = 'Category added'
      redirect_to root_path
    else
      flash[:error] = 'An error message'
      render :new
    end
    @user.categories << @category
  end

  def show
    @todos = @user.todos.all
  end

  def edit
  end

  def update
  end

  private

  def cat_params
    params.require(:category).permit!
  end

  def set_user
    @user = current_user
  end

  def set_category
    if current_user
      begin
        @category = current_user.categories.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        flash[:error] = "The category you're looking for could not be found."
        redirect_to root_path
      end
    else
      flash[:error] = 'You must be logged in to do that'
      redirect_to root_path
    end
  end

end

# FIGURE OUT HOW TO TIE CATS TO USERS

