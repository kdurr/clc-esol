class AssignmentsController < ApplicationController
  def show
    @assignment = Assignment.find(params[:id])
  end

  def new
    @courses = Course.is_active.order(:name)
    @assignment = Assignment.new
    @assignment_section = AssignmentSection.new
  end

  def create
    assignment = Assignment.new(course_id: assignment_params[:course].to_i, date: Date.parse(assignment_params[:date]))
    if assignment.save!
      sections = assignment.assignment_sections.new(assignment_params[:assignment_section])

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
      assignment_section: [:instructions, :location, :related_urls]
    )
  end
end