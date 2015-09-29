class StoriesController < ApplicationController

  def index
    @stories = Story.all
  end

  def new
    @story = Story.new
  end

  def create
    @question = Question.find(params[:id])
    @story = @question.stories.create(comment_params.merge(user: current_user))
    if @story.save
      redirect_to @story
    else
      render new_story_path, alert: "Your story could not be created. Please try again."
    end
  end

  def show
    @story = Story.find(params[:id])
  end

  def edit
    @story = Story.find(params[:id])
  end

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
    params.require(:story).permit(:body)
  end
end
