require 'rails/generators'

module Contenteditable
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../templates", __FILE__)

      def create_initializer_files
        template "locale_initializer.rb", "config/initializers/locale.rb"
        template "contenteditable_initializer.rb", "config/initializers/contenteditable.rb"
      end

      def installation
        rake("contenteditable:install:migrations")
        route("mount Contenteditable::Engine => '/contenteditable'")
      end

      def add_assets
        insert_into_file "app/assets/javascripts/application#{detect_js_format[0]}", "#{detect_js_format[1]} require contenteditable/contenteditable\n", :after => "jquery_ujs\n"
        insert_into_file "app/assets/stylesheets/application#{detect_css_format[0]}", "#{detect_css_format[1]} require contenteditable/contenteditable\n", :after => "require_self\n"
      end

      def detect_js_format
        return ['.js.coffee', '#='] if File.exist?('app/assets/javascripts/application.js.coffee')
        return ['.js', '//='] if File.exist?('app/assets/javascripts/application.js')
      end

      def detect_css_format
        return ['.css', ' *='] if File.exist?('app/assets/stylesheets/application.css')
        return ['.css.sass', ' //='] if File.exist?('app/assets/stylesheets/application.css.sass')
        return ['.sass', ' //='] if File.exist?('app/assets/stylesheets/application.sass')
        return ['.css.scss', ' //='] if File.exist?('app/assets/stylesheets/application.css.scss')
        return ['.scss', ' //='] if File.exist?('app/assets/stylesheets/application.scss')
      end

    end

  end

end
