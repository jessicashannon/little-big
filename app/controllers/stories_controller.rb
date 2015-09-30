class StoriesController < ApplicationController

  def index
    @stories = Story.all
  end

  def new
    @story = Story.new
    @story.questions << Question.find(params[:question_id]) if params[:question_id]
  end

  def create
    @story = Story.new(story_params)
    if @story.save
      redirect_to @story.questions.last
    else
      render new_question_story_path, alert: "Your story could not be created. Please try again."
    end
  end

  def show
    @story = Story.find(params[:id])
  end

  def edit
    @story = Story.find(params[:id])
  end

  # def destroy
  #   @story = Story.find(params[:id])
  #   @question = @story.questions.last.id
  #   @story.destroy
  #   redirect_to @question
  # end

  def update
    @story = Story.find(params[:id])
      if @story.update(story_params)
        flash[:notice] = "Your story has been updated"
        redirect_to @story
      else
        render :edit
      end
  end

private

  def story_params
    params.require(:story).permit(:body, :question_id)
  end
end
