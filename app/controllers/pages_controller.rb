class PagesController < ApplicationController

  before_action :confirm_logged_in
  before_action :find_subjects, :only => [:new, :create,:edit, :update]
  before_action :find_subject
  
  
def index
    @pages= @subject.pages.sorted
    render json: @pages
end

def show
@page=Page.find(params[:id])
render json: @page
end

def create
@page=Page.create(check_params)    

    if @page.valid? 
      render json: @page 
    else
       render json: {error: @page.errors.full_messages} 
    end
end

def update
    @page=Page.find(params[:id])
    @page.update(check_params)
    if @page.valid? 
        render json: {message: 'Record Updated Successfully' ,Record:@page} 
      else
         render json: {error: @page.errors.full_messages} 
      end
end

def destroy
@page=Page.find(params[:id])
@page.destroy
render json: {message:"Record Deleted Successfully", Record: @page}

end

private
def check_params
  params.permit(:subject_id, :name, :position, :visible, :permalink)
end
def find_subjects
  @subjects=Subject.sorted 
end
def find_subject
  @subject= Subject.find(params[:subject_id])
end

end
