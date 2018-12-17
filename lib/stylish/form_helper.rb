module Stylish
  module FormHelper
    def edit_styles_link(name, html_params = {})
      html_params ||= { class: 'form-control' }
      default_html = { remote: true, id: 'stylish' }

      link_to name, stylish.new_popup_path, html_params.merge(default_html)
    end
  end
end
