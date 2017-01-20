module ApplicationHelper
  def shallow_target(object, path)
    case action_name
      when 'edit', 'update'
        object
      when 'new', 'create'
        path + [object]
      else
        object
    end
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

  def current_user_name
    current_user&.title
  end

  def icon(icon, text = nil, html_options = {})
    text, html_options = nil, text if text.is_a?(Hash)

    content_class = "fa fa-#{icon}"
    content_class << " #{html_options[:class]}" if html_options.key?(:class)
    html_options[:class] = content_class

    html = content_tag(:i, nil, html_options)
    html << ' ' << text.to_s unless text.blank?
    html
  end

  def start_year
    @start_year ||= Time.new.year - 100
  end

  def placeholder_url
    image_url("placeholder.#{I18n.locale}.png")
  end
end
