class HolesController < ApplicationController
  def edit
    @hole = Hole.find(params[:id])
    @course = Course.find(@hole.course_id)
  end

  def update
    @hole = Hole.find(params[:id])
    @course = Course.find(@hole.course_id)
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