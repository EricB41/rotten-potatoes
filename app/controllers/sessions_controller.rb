class SessionsController < ApplicationController
    def user_params
        params.require(:login).permit(:user_id, :email)
    end
    
    def create
        if User.find_by_user_id(params[:login][:user_id]) && User.find_by_email(params[:login][:email])
            @user = User.find_by_user_id(params[:login][:user_id])
            flash[:notice] = "You are logged in as #{@user.user_id}"
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