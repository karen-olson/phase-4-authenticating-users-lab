class SessionsController < ApplicationController
    def create 
        user = User.find_by_username(sessions_params[:username])
        session[:user_id] = user.id 
        render json: user
    end

    def destroy 
        session.delete :user_id
        head :no_content
    end

    private 

    def sessions_params 
        params.permit(:username, :session)
    end
end
