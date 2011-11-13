module ApplicationHelper

  def stylesheets(*files)
    content_for(:head) { stylesheet_link_tag(*files) }
  end
end
