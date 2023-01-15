class AuthenticationController < ApplicationController
    skip_before_action :authenticate_request

    # POST /login

    def login
        @user = User.find_by_email(params[:email])
        if @user && @user.authenticate(params[:password])
            token = jwt_encode({user_id: @user.id})
            render json: {token: @user}, status: :ok
        else
            render json: {error: "Invalid email or password"}, status: :unauthorized
        end
    end


    # def authenicate
    #     command = AuthenticateUser.call(params[:email], params[:password])
    #     if command.success?
    #         render json: { auth_token: command.result }
    #     else
    #         render json: { error: command.errors }, status: :unauthorized
    #     end
    # end
end
