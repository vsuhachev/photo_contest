module ApplicationHelper
  def shallow_target(object, path)
    action_name == 'edit' ? object : path + [object]
  end
end
