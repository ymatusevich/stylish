require 'stylish/form_helper'

module Stylish
  class Engine < ::Rails::Engine
    isolate_namespace Stylish

    initializer :append_migrations do |app|
      paths['db/migrate'].expanded.each do |migration|
        app.paths['db/migrate'] << migration
      end
    end

    initializer 'stylish.initialize' do
      ActionView::Base.send(:include, ::Stylish::FormHelper)
    end

    config.before_initialize do
      if config.action_view.javascript_expansions
        config.action_view.javascript_expansions[:stylish] = %w(stylish)
      end
    end

    config.action_controller.include_all_helpers = false
    config.paths.add 'app/models/concerns', eager_load: true
  end
end
