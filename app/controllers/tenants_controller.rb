class TenantsController < ApplicationController

    def create
        tenant = Tenant.new(tenant_params)
        if tenant.save 
            render json: tenant,
            status: :created
        else 
            render json: tenant.errors, 
            status: :unprocessable_entity
        end 
    end 

    def update 
        tenant = Tenant.find_by(id: params[:id])
        if tenant.update(tenant_params)
            render json: tenant,
            status: :ok
        else 
            render json: tenant.errors,
            status: :unprocessable_entity
        end 
    end 

    def destroy 
        tenant = Tenant.find_by(id: params[:id])
        if tenant 
            tenant.delete
            render json: "Deleted"
        else 
            render json: {error: "Tenant Not Found"},
            status: :not_found
        end 
    end 

    def index 
        render json: Tenant.all
    end 

    private 

    def tenant_params
        params.permit(:name, :age)
    end 

end
