require_dependency 'stylish/service_factory'

module Stylish
  class ApplicationController < ActionController::Base
    layout 'stylish/layouts/application'
  end
end
