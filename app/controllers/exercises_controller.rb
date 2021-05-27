class ExercisesController < ApplicationController

  before_action :set_exercise, only: %i[edit update destroy]

  def index
    @exercises = Exercise.order(id: :asc)
  end

  def new
    @exercise = Exercise.new
  end

  def create
    @exercise = Exercise.new(exercise_params)
    if @exercise.save
      redirect_to exercises_path, notice: "登録しました"
    else
      flash.now[:alert] = "登録に失敗しました"
      render :new
    end
  end

  def edit
  end

  def update
    if @exercise.update(exercise_params)
      redirect_to exercises_path, notice: '更新しました'
    else
      flash.now[:alert] = '更新に失敗しました'
      render :edit
    end
  end

  def destroy
    @exercise.destroy!
    redirect_to exercises_path, alert: '削除しました'
  end

  private

  def exercise_params
    params.require(:exercise).permit(:name)
  end

  def set_exercise
    @exercise = Exercise.find(params[:id])
  end
end