class SectionsController < ApplicationController
  before_action :confirm_logged_in
  before_action :find_page , :only => [:index]
  
    def index
        @sections= @page.sections
        render json: @sections
    end
    
    def show
    @section=Section.find(params[:id])
    render json: @section
    end
    
    def create
    @section=Section.create(check_params)    
    
        if @section.valid? 
          render json: @section 
        else
           render json: {error: @section.errors.full_messages} 
        end
    end
    
    def update
        @section=Section.find(params[:id])
        @section.update(check_params)
        if @section.valid? 
            render json: {message: 'Record Updated Successfully' ,Record:@section} 
          else
             render json: {error: @section.errors.full_messages} 
          end
    end
    
    def destroy
    @section=Section.find(params[:id])
    @section.destroy
    render json: {message:"Record Deleted Successfully", Record: @section}
    
    end
    private
    def check_params
      params.permit(:page_id, :name, :position, :visible, :permalink, :content, :content_type)
    end
    def find_page
      @page=Page.find(params[:page_id])
    end
end
