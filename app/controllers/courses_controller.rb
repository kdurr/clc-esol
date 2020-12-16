class CoursesController < ApplicationController
  def index
    @courses = Course.is_active
  end

  def show
    @course = Course.find(params[:id])
    @assignments = @course.assignments
  end

  def new
    @course = Course.new
  end

  def create
    course = Course.new(course_params)

    if course.save!
      redirect_to courses_path
    else
      # do some error
    end
  end

  def edit
  end

  def update
  end

  private

  def course_params
    params.require(:course).permit(:name, :description, :active)
  end
end