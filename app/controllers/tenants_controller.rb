class TenantsController < ApplicationController
    def index
        render json: Tenant.all
    end

    def show
        render json: find_tenant, status: :found
    end

    def create
        tenant = Tenant.create!(tenant_params)
        render json: tenant, status: :created
    end

    def update
        render json: find_tenant.update!(tenant_params), status: :accepted
    end

    def destroy
        find_tenant.destroy
        head :no_content
    end

    private

    def find_tenant
        Tenant.find(params[:id])
    end

    def tenant_params
        params.permit(:name, :age)
    end
end
