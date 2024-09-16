class CategoriesController < ApplicationController
  before_action :get_category, only: [:edit, :destroy, :update, :show]
def index
  @categories = Category.all
end

def show
end

def new
  @category = Category.new
end

def create
@category = Category.new(category_params)
if @category.save
  redirect_to @category
else
  render :new, status: :unprocessable_entity
end
end

def edit
end

def update
if @category.update(category_params)
  redirect_to @category
else
  render :new, status: :unprocessable_entity
end
end

def destroy
@category.destroy
redirect_to root_path
end

private
def category_params
  params.require(:category).permit([:name, :description])
end

def get_category
  @category = Category.includes(:notices).find(params[:id])
end
end
