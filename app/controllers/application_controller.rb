class ApplicationController < ActionController::API

    private
    def confirm_logged_in
        unless session[:user_id]
            render json: {message: "Please login"}
        end
    end

end
