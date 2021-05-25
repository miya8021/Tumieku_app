class ArticesController < ApplicationController
  def index
  end

  def new
    @artice = Artice.new
  end

  def create
    @artice = Artice.new(artice_params)
    @artice.user_id = current_user.id
    @artice.save
    redirect_to artices_path
  end

  def show
    @artice = Artice.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def artice_params
    params.require(:artice).permit(:day, :minutes, :body)
  end
end
