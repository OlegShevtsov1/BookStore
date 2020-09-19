module ApplicationHelper
  def flash_class(key)
    case key
    when 'notice' then 'alert alert-success'
    when 'alert' then 'alert alert-danger'
    else
      ''
    end
  end
end
