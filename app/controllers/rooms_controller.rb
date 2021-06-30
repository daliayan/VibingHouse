class RoomsController < ApplicationController
    before_action :require_login

    def index
        @rooms = Room.all
    end


    def new
        if params[:house_id] && @house = House.find_by_id(params[:house_id])
            @room = @house.rooms.build
        else
            @room = Room.new
        end

        # @room = Room.new(house_id: params[:house_id])
    end

    def create
        @room = Room.new(room_params)
        @room.house_id = params[:house_id]
        if @room.save
            redirect_to rooms_path
        else
            render :new
        end
    end

    # def edit
    #     @room = Room.find(params[:id])
    # end

    def update
        @room = Room.find(params[:id])
        @room.update(room_params)
        if @room.valid?
            redirect_to rooms_path
        else
            render :edit
        end
    end

    def destroy
        @room = Room.find(params[:id])
        @room.destroy
        redirect_to rooms_path
    end

    private
    
    def room_params
        params.require(:room).permit(:name, :windows, :hex)
    end


end