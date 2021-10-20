class LeasesController < ApplicationController

    def create 
        lease = Lease.new(lease_params)
        if lease.save 
            render json: lease,
            status: :created
        else 
            render json: lease.errors,
            status: :unprocessable_entity
        end 
    end 

    def destroy 
        lease = Lease.find_by(id: params[:id])
        if lease 
            lease.delete
            render json: "Deleted"
        else 
            render json: {error: "Lease Not Found"}, 
            status: :not_found
        end 
    end 

    private 

    def lease_params
        params.permit(:rent, :tenant_id, :apartment_id)
    end 

end
