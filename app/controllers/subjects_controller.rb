class SubjectsController < ApplicationController
  before_action :confirm_logged_in
  def index
    logger.debug("*** testing th logger *******")
    @subjects=Subject.sorted
    render json: @subjects

  end

  def show
    @subject=Subject.find(params[:id])
    render json: @subject 

  
  end

  def new
  end

  def create
    @subject=Subject.create(check_params)
    # flash[:notice]= " Subject '#{@subject.name}' created successfully"
    # redirect_to subjects_path
    if @subject.valid? 
      render json: @subject 
    else
       render json: {error: @subject.errors.full_messages} 
    end
  end

  def edit
  end

  def update
    @subject=Subject.find(params[:id])
    @subject.update(check_params)
    if @subject.valid? 
      render json: {message: 'Record Updated Successfully' ,Record:@subject} 
    else
       render json: {error: @subject.errors.full_messages} 
    end
  end
  
  def delete
  end

  def destroy
    @subject=Subject.find(params[:id])
    @subject.destroy
    # render json: {message:"Record Deleted Successfully", Record: @subject}
    redirect_to subjects_path
  end

  private
  def check_params
    params.permit(:name, :position, :visible)
  end

end
