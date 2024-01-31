class MyCrumbsBuilder < BreadcrumbsOnRails::Breadcrumbs::SimpleBuilder
  def render_element(element)
    content = if element.path.nil?
      compute_name(element)
    else
      @context.link_to_unless_current(compute_name(element), compute_path(element), element.options)
    end
    if @options[:tag]
      @context.content_tag(@options[:tag], content, @options[:tag_options])
    else
      ERB::Util.h(content)
    end
  end
end
