class CakesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :index]
  before_action :set_cake, only: [:show, :edit, :update, :destroy]
  def index
    @cakes = policy_scope(Cake).order(created_at: :desc)
    # @cakes = Cake.all
  end

  def show
  end

  def new
    @cake = Cake.new
    authorize @cake
  end

  def create
    @cake = Cake.new(cake_params)
    @cake.user = current_user
    authorize @cake

    if @cake.save
      redirect_to cake_path(@cake), notice: 'Cake was successfully added.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @cake.update(cake_params)
      redirect_to cake_path(@cake), notice: 'Cake was successfully changed.'
    else
      render :edit
    end
  end

  def destroy
  end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_cake
      @cake = Cake.find(params[:id])
      authorize @cake
    end

    # Only allow a list of trusted parameters through.
    def cake_params
      params.require(:cake).permit(:description, :ingredients, :requested_compensation, :available_slices, :user_id, :name, :eat_by)
    end

end
