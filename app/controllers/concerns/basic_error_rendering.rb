module BasicErrorRendering
  extend ActiveSupport::Concern

  private
    def not_found! resource_name="Ressource", id
      render json: {message: "Not Found", errors: ["#{resource_name} Not Found with id #{id}"]}, status: :not_found, location: nil
    end

    def no_company_provided!
      render json: {message: "Unprocessable", errors: ['company_id is required']}, status: 422, location: nil
    end    
end
