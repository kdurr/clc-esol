class AssignmentsController < ApplicationController
  def show
    @assignment = Assignment.find(params[:id])
  end

  def new
    @courses = Course.is_active.order(:name)
    @assignment = Assignment.new
    @assignment_sections = @assignment.assignment_sections.build
  end

  def create
    byebug
    assignment = Assignment.new(
      course_id: assignment_params[:course].to_i,
      date: Date.parse(assignment_params[:date]),
      assignment_sections: assignment_params[:assignment_sections_attributes].values
    )
    byebug
    if assignment.save!
      sections = assignment.assignment_sections.new(assignment_params[:assignment_sections_attributes])

      if sections.save!
        redirect_to admins_path
      end
    end
  end

  def edit
  end

  def update
  end

  private

  def assignment_params
    params.require(:assignment).permit(
      :course,
      :date,
      assignment_sections_attributes: [:id, :instructions, :location, :related_urls]
    )
  end
end