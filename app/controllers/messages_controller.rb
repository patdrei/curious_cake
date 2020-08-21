class MessagesController < ApplicationController
  def new
    @message = Message.new
    @request = Request.find(params[:request_id])
    @messages = @request.messages
    authorize @request
  end

  def create
    @message = Message.new(strong_params)
    @request = Request.find(params[:request_id])
    authorize @request
    @user = current_user
    @message.request = @request
    @message.user = @user
    if @message.save
      redirect_to new_request_message_path(@request), notice: 'You have successfully messaged'
    else
      render :new
    end
  end

  private

  def strong_params
    params.require(:message).permit(:content)
  end
end
