class HolesController < ApplicationController
  def edit
    @course = Course.find(params[:course_id])
    @hole = @course.holes.find(params[:id])
  end

  def update
    @course = Course.find(params[:course_id])
    @hole = @course.holes.find(params[:id])
      if @hole.update(hole_params)
        flash[:notice] = "Hole successfully updated"
        redirect_to course_path(@course)
      else
        render :edit
      end
  end

  private

  def hole_params
    params.require(:hole).permit(
      :yardage, :course_id, :par
    )
  end
end