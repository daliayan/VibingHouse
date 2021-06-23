class HousesController < ApplicationController
    before_action :not_logged_in

    def index 
        @houses = House.all
    end

    def show
        @house = House.find_by(params[:id])
    end

    def new
        @house = House.new(house_params)
    end

    def create
        @house = House.new(house_params)
        if @house.save
            redirect_to house_path(@house)
        else
            render :new
        end
    end
    
    def destroy
    end

    private

    def house_params
        params.permit(:user_id, :name, :hex, :size, :price)
    end

end