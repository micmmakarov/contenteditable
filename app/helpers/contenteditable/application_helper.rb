module Contenteditable
  module ApplicationHelper

    def ceditable(key, tag="span", html_options={})
      content = Translation.find_by_key(key).try(:value) || ""
      # content = I18n.t(key)

      if is_authorized?
        content = "this is editable" if content.blank?
        html_options.merge!(:contenteditable => true, "data-tag" => key)
      end
      content_tag(tag, content, html_options)
    end

    def contenteditable_assets
      if is_authorized?
        a=javascript_include_tag "contenteditable/contenteditable"
        b=stylesheet_link_tag    "contenteditable/contenteditable", :media => "all"
        c = a + b
        c
      end
    end

    def save_button
      if is_authorized?
        render "contenteditable/tools/save_button"
      end
    end

    def is_authorized?
      if Contenteditable::Engine.ce_filter.present?
        main_app.scope.send(Contenteditable::Engine.ce_filter)
      else
        true
      end
    end

  end
end
