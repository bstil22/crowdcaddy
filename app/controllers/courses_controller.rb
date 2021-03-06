class CoursesController < ApplicationController
  include HolesHelper
  
  def index
    @courses = Course.all
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    if @course.save
      create_holes(@course)
      redirect_to course_path(@course)
    else
      render 'new'
    end
  end

  def edit
    @course = Course.find(params[:id])
  end

  def update
    @course = Course.find(params[:id])
      if @course.update(course_params)
        flash[:notice] = "Course successfully updated"
        redirect_to course_path(@course)
      else
        render :edit
      end
  end

  def show
    @course = Course.find(params[:id])
    @holes = @course.holes.order("id asc")
  end

  private

  def course_params
    params.require(:course).permit(
      :name,
      :state,
      :city,
      :architect,
      :style,
      :rating,
      :slope,
      :number_holes
    )
  end

end
