class RoomsController < ApplicationController
  before_action :authenticate_user!

  def index
    @rooms = Room.all
  end

  def create
    if Room.between(params[:sender_id], params[:recipient_id]).present?
      @room = Room.between(params[:sender_id], params[:recipient_id]).first
    else
      @room = Room.create!(room_params)
    end
    redirect_to chats_path(room_id: @room)
  end

  private

  def room_params
    params.permit(:sender_id, :recipient_id)
  end
end
