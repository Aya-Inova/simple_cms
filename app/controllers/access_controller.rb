class AccessController < ApplicationController
    before_action :confirm_logged_in, :except => [:login, :attempt_login, :logout]

    def menu #display text and links
    end
   
    def login #display a login form
        render json: {message: "you are in the login form"}
    end

    def attempt_login
        if params[:username].present? && params[:password].present?
            found_user=AdminUser.where(:username => params[:username]).first
            if (found_user )
                authorized_user=found_user.authenticate(params[:password])
            end
        end
        if authorized_user #will be nill or object
            session[:user_id]= authorized_user.id
            render json: {message: "Successfully Logged In", "session id": session[:user_id]}
            # redirect_to admin_path
        else
            render json: {message: "Invalid username/password combination"}

        end
    end


    def logout
        session[:user_id]=nil
        render json: {message: "Successfully Logged out", "session id": session[:user_id]}
    end

end
