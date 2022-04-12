class CampersController < ApplicationController
    #GET /campers
    def index
        render json: Camper.all, only: [:id, :name, :age], status: :ok
    end

    #GET /campers/:id
    def show
        camper = Camper.find(params[:id])
        render json: camper, serializer: CamperActivitiesSerializer, status: :ok
    rescue ActiveRecord::RecordNotFound
        render json: {error: "Camper not found"}, status: :not_found
    end

    #POST /campers
    def create
        camper = Camper.create!(camper_params)
        render json: camper, status: :created
    rescue ActiveRecord::RecordInvalid => e
        render json: { errors: e.record.errors.full_messages }, status: :unprocessable_entity
    end

    private

    def camper_params
        params.permit(:name, :age)
    end
end
