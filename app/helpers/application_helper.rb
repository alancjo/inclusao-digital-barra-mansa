module ApplicationHelper
  def breadcrumb(*crumbs)
    content_tag(:nav, class: "flex mb-6 text-sm", 'aria-label': "Breadcrumb") do
      content_tag(:ol, class: "inline-flex items-center space-x-1 md:space-x-3") do
        crumbs.map.with_index do |(label, path), index|
          content_tag(:li, class: "inline-flex items-center") do
            separator = index > 0 ? content_tag(:span, "/", class: "mx-2 text-slate-400") : "".html_safe
            link_class = index == crumbs.size - 1 ? "text-slate-700 font-medium" : "text-slate-500 hover:text-brand-600"
            separator + (path ? link_to(label, path, class: link_class) : content_tag(:span, label, class: link_class))
          end
        end.join.html_safe
      end
    end
  end

  def nav_link_class(path)
    base_class = "inline-flex items-center text-sm font-medium transition"
    active_class = "text-brand-400 border-b-2 border-brand-400"
    inactive_class = "hover:text-brand-400"

    current_page?(path) ? "#{base_class} #{active_class}" : "#{base_class} #{inactive_class}"
  end

  def mobile_nav_link_class(path)
    base_class = "block rounded-md px-4 py-2 text-sm font-medium text-center"
    active_class = "bg-brand-500 text-white"
    inactive_class = "border border-white/40 hover:bg-white/10"

    current_page?(path) ? "#{base_class} #{active_class}" : "#{base_class} #{inactive_class}"
  end
end
