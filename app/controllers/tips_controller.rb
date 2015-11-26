class TipsController < ApplicationController
  before_action :set_course_and_holes
  before_action :upvote_downvote_helper, only: [:upvote, :downvote]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]

  def index
    @tips = @hole.present? ? @hole.tips : Tip.all
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
    @tip.update(tip_params)
    redirect_to course_path(@course)
  end

  def upvote
    @tip = Tip.find(params[:id])
    @tip.upvote_from current_user
    redirect_to course_path(@course)
  end

  def downvote
    @tip = Tip.find(params[:id])
    @tip.downvote_from current_user
    redirect_to course_path(@course)
  end

  def show
    @tip = Tip.find(params[:id])
  end


  private

  def tip_params
    params.require(:tip).permit(
      :body,:hole_id, :user_id, :yardage
      )
  end

  def set_course_and_holes
    @hole = Hole.find(params[:hole_id]) if params[:hole_id].present?
    @course = Course.find(@hole.course_id) if params[:hole_id].present?
  end
  
  def upvote_downvote_helper
    @tip = Tip.find(params[:id])
    @hole = Hole.find(@tip.hole_id)
    @course = Course.find(@hole.course_id)
  end

end
