require_dependency 'stylish/application_controller'

module Stylish
  class StylesController < ApplicationController
    include Stylish::CommonBehavior

    def enable
      session[:style_editor] = params[:enable].present?
      redirect_to styles_path
    end
  end
end
