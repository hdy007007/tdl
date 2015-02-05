class FeaturesController < ApplicationController
  before_action :set_user, only: [:index, :show, :edit, :new, :create]

  before_action :require_user

  def index
    @features = Feature.all
  end

  def new
    @feature = Feature.new
  end

  def create
    @feature = Feature.new(feature_params)
    @feature.user = @user
    if @feature.save
      flash[:notice] = 'Thanks for the suggestion'
      redirect_to root_path
    else
      render :new
    end
  end

private

  def set_user
    @user = current_user
  end

  def feature_params
    params.require(:feature).permit!
  end

end