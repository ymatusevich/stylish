module Stylish
  module StylesHelper
    def enable_editor_link
      if session[:style_editor].present?
        link_to 'Disable editor', enable_styles_path, class: 'btn btn-warning'
      else
        link_to 'Enable editor', enable_styles_path(enable: true), class: 'btn btn-warning'
      end
    end
  end
end
