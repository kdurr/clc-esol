module ApplicationHelper
  def add_assignment_section(f)
    form_section = render partial: 'assignment_section', locals: { form: f }
    link_to('Add another section', '#', class: "add_section", data: { fields: form_section })
  end
end
