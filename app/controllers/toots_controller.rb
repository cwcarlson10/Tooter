class TootsController < ApplicationController
  before_action :set_toot, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:index, :show]

  def index
    @toots = Toot.all
  end

  def show
  end

  def new
    @toot = Toot.new
  end

  def create
    @toot = Toot.new(toot_params)
    if @toot.save
      redirect_to @toot
    else
      render :new
    end
  end

  def edit
  end

  def update
    @toot.update_attributes(toot_params)
    if @toot.save
      redirect_to @toot
    else
      render :edit
    end
  end

  def destroy
    @toot.delete
    redirect_to toots_path
  end

  private

    def toot_params
      params.require(:toot).permit(:body, :user_id)
    end

    def set_toot
      @toot = Toot.find(params[:id])
    end
end
