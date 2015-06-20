class TipsController < ApplicationController
  def new
    @course = Course.find(params[:course_id])
    @hole = @course.holes.find(params[:hole_id])
    @tip = @hole.tips.new
  end
  def create
    @course = Course.find(params[:course_id])
    @hole = @course.holes.find(params[:hole_id])
    @tip = @hole.tips.new(tip_params)
    @tip.user = current_user
    if @tip.save
      redirect_to course_path(@course)
    else
      render 'new'
    end
  end
  def edit
    @course = Course.find(params[:course_id])
    @hole = Course.holes.find(params[:hole_id])
    @tip = @course.hole.tips.find(:tip_id)
  end
  def update
      @course = Course.find(params[:course_id])
      @hole = @course.holes.find(params[:hole_id])
      @tip.update(tip_params)
      redirect_to course_path(@course)
  end

  private

  def tip_params
    params.require(:tip).permit(
      :body, :course_id, :hole_id, :user_id
    )
  end
end
