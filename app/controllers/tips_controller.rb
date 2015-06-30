class TipsController < ApplicationController
  before_action :set_course_and_holes
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  def index
    @tips = @course.present? ? @course.tips : Tip.all
  end
  def new
    @tip = @hole.tips.new
  end
  def create
    @tip = @hole.tips.new(tip_params)
    @tip.user = current_user
    if @tip.save
      redirect_to course_path(@course)
    else
      render 'new'
    end
  end
  def edit
    @tip = @hole.tips.find(params[:id])
  end
  def update
    @course = Course.find(params[:course_id])
    @hole = @course.holes.find(params[:hole_id])
    @tip.update(tip_params)
    redirect_to course_path(@course)
  end

  def upvote
    @tip = @hole.tips.find(params[:id])
    @tip.upvote_from current_user
    redirect_to course_path(@course)
  end
  def downvote
    @tip = @hole.tips.find(params[:id])
    @tip.downvote_from current_user
    redirect_to course_path(@course)
  end
  def show
    @tip = Tip.find(params[:id])
  end


  private

  def tip_params
    params.require(:tip).permit(
      :body, :course_id, :hole_id, :user_id, :yardage
      )
  end
  def set_course_and_holes
    @course = Course.find(params[:course_id]) if params[:course_id].present?
    @hole = @course.holes.find(params[:hole_id]) if params[:hole_id].present?
  end

end
