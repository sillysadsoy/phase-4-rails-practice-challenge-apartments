class ApartmentsController < ApplicationController

    def create
        apartment = Apartment.new(apartment_params)
        if apartment.save 
            render json: apartment,
            status: :created
        else 
            render json: apartment.errors, 
            status: :unprocessable_entity
        end 
    end 

    def update 
        apartment = Apartment.find_by(id: params[:id])
        if apartment.update(apartment_params)
            render json: apartment,
            status: :ok
        else 
            render json: apartment.errors,
            status: :unprocessable_entity
        end 
    end 

    def destroy 
        apartment = Apartment.find_by(id: params[:id])
        if apartment 
            apartment.delete
            render json: "Deleted"
        else 
            render json: {error: "Apt Not Found"},
            status: :not_found
        end 
    end 

    def index 
        render json: Apartment.all
    end 

    private 

    def apartment_params
        params.permit(:number)
    end 

end
