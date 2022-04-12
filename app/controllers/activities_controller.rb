class ActivitiesController < ApplicationController
    #GET /activities
    def index
        render json: Activity.all, status: :ok
    end

    #DELETE /activities/:id
    def destroy
        activity = Activity.find(params[:id])
        activity.destroy
        head :not_found
    rescue ActiveRecord::RecordNotFound
        render json: { error: "Activity not found"}, status: :not_found
    end

end
