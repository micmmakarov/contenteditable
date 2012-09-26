require_dependency "contenteditable/application_controller"

module Contenteditable
  class ContentsController < ApplicationController
    include ApplicationHelper

    before_filter :filter_for_ce

    def update
      params[:translations].each do |p|
        I18n.backend.store_translations(
          params[:locale] || "en", {p[0] => p[1]}, :escape => false)
      end
      head :status => 204
    end

    private
    def filter_for_ce
      head :status => 401 unless is_authorized?
    end
  end
end
