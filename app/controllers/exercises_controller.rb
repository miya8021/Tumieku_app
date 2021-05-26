class ExercisesController < ApplicationController
  def index
    @exercise = Exercise.new
  end

  def show
  end

  def new
  end

  def create
    exercise = Exercise.new(exercise_params)
    exercise.user_id = current_user.id
    exercise.save
    redirect_to exercise_path
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def exercise_params
    params.require(:exercise).permit(:type)
  end
end
