class AnswersController < ApplicationController
 def index
    @answers = Answer.all
    
  end
  
  def show
    @answer = Answer.find(params[:id])
  end
    
  def new
    @answer = Answer.new
  end
    
  def create
    @answer = Answer.new(answer_params)
    
      if @answer.save
        flash[:message] = "New answer successfully created."
      else
        render :new, status: :unprocessable_entity
        flash[:message] = "Try to create again."
      end
  end
    
  def edit
    @answer = Answer.find(params[:id])
  end
    
  def update
    @answer = Answer.find(params[:id])
    
      if @answer.update(answer_params)
        flash[:message] = "Answer successfully updated."
      else
        render :edit, status: :unprocessable_entity
        flash[:message] = "Try to update again."
      end
  end
    
  def destroy
    @answer = Answer.find(params[:id])
    @answer.destroy
    
    redirect_to answers_path, status: :see_other
    flash[:message] = "Answer successfully deleted."
  end
    
  private
    def answer_params
      params.permit(:answer, :question_id, :quizz_id)
    end
end
