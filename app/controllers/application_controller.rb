class ApplicationController < ActionController::API
    include JsonWebToken
    
    before_action :authenticate_request

    private

    def authenticate_request
        header = request.headers['Authorization']
        header = header.split(' ').last if header
        decoded_token = jwt_decode(header)
        @current_user = User.find(decoded_token[:user_id])
    end
end