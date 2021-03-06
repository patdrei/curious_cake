class RequestsController < ApplicationController
  before_action :set_request, only: [:show, :edit, :update, :destroy]
  def index
    @requests = policy_scope(Request).order(created_at: :desc).where(cake_id: params[:cake_id])
    set_cake
  end

  def show
  end

  def new
    @request = Request.new
    authorize @request
    set_cake
    payment_methods
  end

  def create
    @request = Request.new(request_params)
    set_cake
    @user = current_user
    @request.cake = @cake
    @request.user = @user
    @request.status = "pending"
    if @request.save
      redirect_to cake_path(@cake), notice: 'You have successfully requested this cake'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @request.update(request_params)
      redirect_to cake_path(@request), notice: 'Cake was successfully changed.'
    else
      render :edit
    end
  end

  def destroy
    @request.destroy
  end

  def accept
    set_request
    @request.status = "accepted"
    @request.save
    @cake = @request.cake
    @cake.calculated_slices -= @request.requested_slices
    @cake.save
    # redirect_to cake_requests_path(@request.cake)
    redirect_to dashboard_path
  end

  def decline
    set_request
    @request.status = "declined"
    @request.save
    redirect_to dashboard_path
  end

  private

  def payment_methods
    @payments = @cake.requested_compensation.split(",")
  end

    # Use callbacks to share common setup or constraints between actions.
  def set_request
    @request = Request.find(params[:id])
    authorize @request
  end

  def set_cake
    @cake = Cake.find(params[:cake_id])
    authorize @cake
  end

  def request_params
    params.require(:request).permit(:cake_id, :user_id, :requested_slices, :status, :compensation_offered, :content, :calculated_slices)
  end
end
