class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    render :layout => false
  end

  def dashboard
    @cakes = current_user.cakes
    @requests = current_user.requests
    @user = current_user
  end
end
