class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end
  
  def show
    @question = Question.find(params[:id])
  end
    
  def new
    @question = Question.new
  end
    
  def create
    @question = Question.new(question_params)
    
      if @question.save
        redirect_to questions_path
        flash[:message] = "New question successfully created."
      else
        render :new, status: :unprocessable_entity
        flash[:message] = "Try to create again."
      end
  end
    
  def edit
    @question = Question.find(params[:id])
  end
    
  def update
    @question = Question.find(params[:id])
    
      if @question.update(question_params)
        redirect_to questions_path
        flash[:message] = "Question successfully updated."
      else
        render :edit, status: :unprocessable_entity
        flash[:message] = "Try to update again."
      end
  end
    
  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    
    redirect_to questions_path, status: :see_other
    flash[:message] = "Question successfully deleted."
  end
    
  private
    def question_params
      params.require(:question).permit(:question, :quizz_id, :option, :option2, :option3, :option4, :correct_answer)
    end
end
