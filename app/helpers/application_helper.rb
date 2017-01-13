module ApplicationHelper
  def shallow_target(object, path)
    action_name == 'edit' ? object : path + [object]
  end

  def permitted_attributes_for(record, action = params[:action])
    policy = policy(record)
    method_name = if policy.respond_to?("permitted_attributes_for_#{action}")
                    "permitted_attributes_for_#{action}"
                  else
                    "permitted_attributes"
                  end
    policy.public_send(method_name)
  end
end
