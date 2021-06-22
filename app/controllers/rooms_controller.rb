class RoomsController < ApplicationController

    def index
        @rooms = Room.all
    end

    def show
        @room = Room.find(params[:id])
    end

    def new
        if params[:user_id] && @user = User.find_by_id(params[:user_id])
            @room = @user.rooms.build
        else
            @room = Room.new
            @room.build_house
        end
    end

    def create
        @room = current_user.rooms.build(room_params)
        if @room.save
            redirect_to rooms_path
        else
            render :new
        end
    end

    def edit
        @room = Room.find(params[:id])
    end

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
        params.require(:room).permit(:name, :room_description, :windows, :hex, :user_id, :house_id)
    end


end