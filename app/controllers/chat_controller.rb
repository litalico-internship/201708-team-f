class ChatController < ApplicationController
  def show
    @adviser = Adviser.find(params[:adviser_id])
  end

  def create
  end

  def destroy
  end
end
