class QuizzsController < ApplicationController
  def index
    @quizzs = Quizz.all
  end
    
  def new
    @quizz = Quizz.new
  end
    
  def create
    @quizz = Quizz.new(quizz_params)
    
      if @quizz.save
        redirect_to quizzs_path
        flash[:message] = "New quiz successfully created."
      else
        render :new, status: :unprocessable_entity
        flash[:message] = "Try to create again."
      end
  end
    
  def edit
    @quizz = Quizz.find(params[:id])
  end

  def show
    @quizz = Quizz.find(params[:id])
  end
    
  def update
    @quizz = Quizz.find(params[:id])
    
      if @quizz.update(quizz_params)
        redirect_to quizzs_path
        flash[:message] = "Quiz successfully updated."
      else
        render :edit, status: :unprocessable_entity
        flash[:message] = "Try to update again."
      end
  end
    
  def destroy
    @quizz = Quizz.find(params[:id])
    @quizz.destroy
    
    redirect_to quizzs_path, status: :see_other
    flash[:message] = "Quizz successfully deleted."
  end
    
  private
    def quizz_params
      params.require(:quizz).permit(:name, :category_id)
    end
 
end
