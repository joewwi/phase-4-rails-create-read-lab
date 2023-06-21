class PlantsController < ApplicationController
    def index
        plants = Plant.all
        render json: plants, status: :ok
    end

    def show
        plant = Plant.find_by(id: params['id'])

        if plant 
            render json: plant, status: :ok
        else
            render json: {error: "Plant not found!"}, status: :not_found
        end
    end

    def create
        plant = Plant.create(plant_parameters)

        render json: plant, status: :created
    end

    private

    def plant_parameters
        params.permit(:name, :price, :image)
    end
end
