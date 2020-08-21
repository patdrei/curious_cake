class CakesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :index]
  before_action :set_cake, only: [:show, :edit, :update, :destroy]
  def index
    if params[:query].present?
      @cakes = policy_scope(Cake).search_by_name_and_description(params[:query])
    else
      @cakes = policy_scope(Cake).order(created_at: :desc)
    end
    # @cakes = Cake.all
  end

  def show
    payment_methods
    current_user == @cake.user ? @owner = true : @owner = false
  end

  def new
    @cake = Cake.new
    authorize @cake
  end

  def create
    @cake = Cake.new(cake_params)
    @cake.user = current_user
    authorize @cake
    @cake.calculated_slices = @cake.available_slices

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
    @cake.destroy
    redirect_to cakes_path
  end

  def payment_methods
    @payments = @cake.requested_compensation.split(",")
  end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_cake
      @cake = Cake.find(params[:id])
      authorize @cake
    end

    # Only allow a list of trusted parameters through.
    def cake_params
      params.require(:cake).permit(:description, :ingredients, :requested_compensation, :available_slices, :name, :eat_by, :photo)
    end
end
