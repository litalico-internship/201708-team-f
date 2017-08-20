class ReservationController < ApplicationController
  protect_from_forgery except: [:new, :create]
  def new
    @adviser = Adviser.find(params[:adviser_id])
  end

  def create
    current_user.reservations.build(adviser_id: params[:adviser_id], start_time:params[:datetime]).save
    redirect_to root_path
  end
end
