class ExercisesController < ApplicationController

  before_action :set_exercise, only: %i[edit update destroy]

  def index
    @exercises = Exercise.order(id: :asc)
  end

  def new
    @exercise = Exercise.new
  end

  def create
    exercise = Exercise.new(exercise_params)
    exercise.user_id = current_user.id
    exercise.save
    redirect_to exercises_path
  end

  def edit
  end

  def update
    @exercise.update!(exercise_params)
    redirect_to exercises_path
  end

  def destroy
    @exercise.destroy!
    redirect_to exercises_path
  end

  private

  def exercise_params
    params.require(:exercise).permit(:name)
  end

  def set_exercise
    @exercise = Exercise.find(params[:id])
  end
end