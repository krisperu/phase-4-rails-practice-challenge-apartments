class ApartmentsController < ApplicationController

    def index
        render json: Apartment.all, status: :ok
    end

    def show
        render json: find_apartment, status: :found
    end

    def create
        apartment = Apartment.create!(apartment_params)
        render json: apartment, status: :created
    end

    def update
        render json: find_apartment.update!(apartment_params), status: :accepted
    end

    def destroy
        find_apartment.destroy
        head :no_content
    end

    private

    def find_apartment
        Apartment.find(params[:id])
    end

    def apartment_params
        params.permit(:number)
    end
end
