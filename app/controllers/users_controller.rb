class UsersController < ApplicationController
    skip_before_action :authenticate_request, only: [:create]
    before_action :set_user, only: [:show, :update, :destroy]

    # GET /users
    def index
        @users = User.all
        render json: @users, status: :ok
    end

    # GET /users/1
    def show
        render json: @user, status: :ok
    end

    # POST /users
    def create
        @user = User.new(user_params)
        if @user.save
            render json: @user, status: :created
        else
            render json:{ errors: @user.errors.full_messages }, status: :unprocessable_entity
        end
    end

    # PATCH/PUT /users/1
    def update
        if @user.update(user_params)
            render json: @user, status: :ok
        else
            render json:{ errors: @user.errors.full_messages }, status: :unprocessable_entity
        end
    end

    # DELETE /users/1
    def destroy
        @user.destroy
        render json:{ message: "User deleted successfully" }, status: :ok
    end

    private
        # Use callbacks to share common setup or constraints between actions.
        def set_user
            @user = User.find(params[:id])
        end

        # Only allow a trusted parameter "white list" through.
        def user_params
            params.require(:user).permit(:username, :email, :name, :password)
        end
end
