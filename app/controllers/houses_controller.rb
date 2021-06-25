class HousesController < ApplicationController
    before_action :not_logged_in

    def index 
        @houses = House.all
    end

    def show
        @house = House.find_by(params[:house_id])
    end

    def new
        @house = House.new(user_id: params[:user_id])
    end

    def create
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
        # @house.update(house_params)
        if @house.valid?
            redirect_to edit_house_path(@house)
        else
            render :edit
        end
    end

    def update
        if @house.update(house_params)
            redirect_to house_path(@house)
        else
            render :edit
        end
    end
    
    def destroy
    end

    private

    def house_params
        params.require(:house).permit(:name, :hex, :size, :price)
    end

end