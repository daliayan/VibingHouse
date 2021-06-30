class HouseRoomsController < ApplicationController

    def new
        @house_room = HouseRoom.new(house_id: params[:house_id])
        # binding.pry
    end

    # binding.pry
    def create
        @house_room = HouseRoom.new(house_room_params)
        @house_room.house_id = params[:house_id]
        if @house_room.save
            redirect_to house_house_room_path(@house_room)
        else
            render :new
        end
    end

    private

    def house_room_params
        params.require(:house_room).permit(:hex, :windows, :room_id, :house_id)
    end

end