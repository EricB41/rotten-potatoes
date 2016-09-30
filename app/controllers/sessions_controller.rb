class SessionsController < ApplicationController
    def user_params
        params.require(:session).permit(:user_id, :email)
    end
    
    def create
        @user = User.find_by_user_id(params[:session][:user_id])
        if @user && (@user.email == params[:session][:email])
            session[:session_token] = @user.session_token
            redirect_to movies_path
        else
           flash[:notice] = "Invalid Login information"
           redirect_to login_path
        end
    end
    
    def destroy
        session[:session_token] = nil
        set_current_user();
        redirect_to movies_path
    end
    
    
end