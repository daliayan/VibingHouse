class HousesController < ApplicationController

    def index 
        @houses = House.all
    end

    def show
        require_login
        @house = House.find_by_id(params[:id])
    end

    def new
        require_login
        @house = House.new(user_id: params[:user_id])
    end

    def create
        require_login
        @house = House.new(house_params)
        @house.user_id = params[:user_id]
        if @house.save
            redirect_to house_path(@house)
        else
            render :new
        end
    end

    def edit
        @house = House.find_by(params[:id])
        require_login
    end

    def update
        @house = House.find(params[:id])
        require_login
        @house.update(house_params)
        if @house.valid?
            redirect_to house_path(@house)
        else
            render :edit
        end
    end
    
    def destroy
        @house = House.find(params[:id])
        require_login
        @house.destroy
        redirect_to root_path
    end

    private

    def house_params
        params.require(:house).permit(:name, :hex, :size, :price)
    end

end