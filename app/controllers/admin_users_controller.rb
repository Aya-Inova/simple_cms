class AdminUsersController < ApplicationController
  before_action :confirm_logged_in
  def index
        @admin_users=AdminUser.sorted
        render json: @admin_users
    
      end
    
      def show
        @admin_user=AdminUser.find(params[:id])
        render json: @admin_user 
    
      
      end
    
      def new
      end
    
      def create
        @admin_user=AdminUser.create(check_params)
        # flash[:notice]= " AdminUser '#{@admin_user.name}' created successfully"
        # redirect_to admin_users_path
        if @admin_user.valid? 
          render json: @admin_user 
        else
           render json: {error: @admin_user.errors.full_messages} 
        end
      end
    
      def edit
      end
    
      def update
        @admin_user=AdminUser.find(params[:id])
        @admin_user.update(check_params)
        if @admin_user.valid? 
          render json: {message: 'Record Updated Successfully' ,Record:@admin_user} 
        else
           render json: {error: @admin_user.errors.full_messages} 
        end
      end
      
      def delete
      end
    
      def destroy
        @admin_user=AdminUser.find(params[:id])
        @admin_user.destroy
        # render json: {message:"Record Deleted Successfully", Record: @admin_user}
        redirect_to admin_users_path
      end

      private
      def check_params
        params.permit(:first_name, :last_name, :username, :email, :password)
      end
end
