require "contenteditable/engine"

module Contenteditable
  class Engine < Rails::Engine
    attr_accessor :ce_filter
    initializer 'my_engine.action_controller' do |app|
      ActiveSupport.on_load :action_controller do
        helper Contenteditable::Engine.helpers
      end
    end
  end
end

module Filtering
  module Foradmins

    def self.included(base)
      base.extend ControllerMethods
    end

    module ControllerMethods
      def contenteditable_filter(*args)
        Contenteditable::Engine.ce_filter = args[0] if args.size > 0
      end
    end
  end
end

ActionController::Base.send(:include, Filtering::Foradmins)

if defined?(Rails)
  require "contenteditable/generators/install_generator"
end