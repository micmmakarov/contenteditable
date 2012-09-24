require_dependency "contenteditable/application_controller"

module Contenteditable
  class ContentsController < ApplicationController
    include ApplicationHelper

    before_filter :filter_for_ce

    def update
      params[:translations].each do |p|
        t = Translation.find_or_initialize_by_key(p[0])
        t.update_attributes(:value => p[1])
      end
      head :status => 204
    end

    private
    def filter_for_ce
      head :status => 401 unless is_authorized?
    end
  end
end
