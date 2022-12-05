class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end
  
  def show
    @category = Category.find(params[:id])
  end
    
  def new
    @category = Category.new
  end
    
  def create
    @category = Category.new(category_params)
    
      if @category.save
        redirect_to categories_path
        flash[:message] = "New category successfully created."
      else
        render :new, status: :unprocessable_entity
        flash[:message] = "Try to create again."
      end
  end
    
  def edit
    @category = Category.find(params[:id])
  end
    
  def update
    @category = Category.find(params[:id])
    
      if @category.update(category_params)
        redirect_to categories_path
        flash[:message] = "Category successfully updated."
      else
        render :edit, status: :unprocessable_entity
        flash[:message] = "Try to update again."
      end
  end
    
  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    
    redirect_to categories_path, status: :see_other
    flash[:message] = "Category successfully deleted."
  end
    
  private
    def category_params
      params.require(:category).permit(:category)
    end
end
