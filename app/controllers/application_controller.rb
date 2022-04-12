class ApplicationController < ActionController::API
rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    private
    def render_unprocessable_entity_response(invalid)
        render json: {error: invalid.record.errors.full_messages}, status: :unprocessable_entity
    end

    def render_not_found_response(exception)
        render json: {error: "#{exception.model} not found"}, status: :not_found
    end

end
 