module ApplicationHelper
  def title(page_title)
    content_for(:title) { page_title }
  end

  def bootstrap_class_for(flash_type)
    case flash_type
      when "success"
       "alert-success"   # Green
      when "error"
       "alert-danger"    # Red
      when "alert"
       "alert-warning"   # Yellow
      when "notice"
       "alert-info"      # Blue
    end
  end
end
