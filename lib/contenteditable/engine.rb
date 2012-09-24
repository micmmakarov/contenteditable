module Contenteditable
  class Engine < ::Rails::Engine
    isolate_namespace Contenteditable

    config.mount_at = '/'

    # Enabling assets precompiling under rails 3.1
    if Rails.version >= '3.1'
      initializer :assets do |config|
        Rails.application.config.assets.precompile += %w( contenteditable/contenteditable.js contenteditable/contenteditable.css)
      end
    end


    # Check the gem config
    initializer "check config" do |app|
      # make sure mount_at ends with trailing slash
      config.mount_at += '/'  unless config.mount_at.last == '/'
    end



  end
end
