class CakesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :index]
  def index
    @cakes = policy_scope(Cake).order(created_at: :desc)
  end

  def show
  end

  def new

    authorize @cake
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
