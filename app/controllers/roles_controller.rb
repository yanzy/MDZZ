class RolesController < ApplicationController

    def index
    end

    def show 
    end

    def new
        
    end

    def update
        
    end

    def destroy
        
    end

    def create
        
    end

    private
        def role_params
            params.require(:role).permit()
        end
end
