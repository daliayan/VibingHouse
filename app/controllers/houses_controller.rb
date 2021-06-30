class HousesController < ApplicationController
    before_action :require_login

    def index 
        @houses = House.all
    end

    def show
        @house = House.find_by_id(params[:id])
    end

    def new
        @house = House.new(user_id: session[:user_id])
    end

    def create
        @house = House.new(house_params)
        @house.user_id = params[:user_id]
        if @house.save
            redirect_to new_house_house_room_path(@house)
        else
            render :new
        end
    end

    def edit
        @house = House.find(params[:id])
    end

    def update
        @house = House.find(params[:id])
        @house.update(house_params)
        if @house.valid?
            redirect_to houses_path
        else
            render :edit
        end
    end
    
    def destroy
        @house = House.find(params[:id])
        @house.destroy
        redirect_to root_path
    end

    private

    def house_params
        params.require(:house).permit(:name, :hex, :size, :price)
    end

end