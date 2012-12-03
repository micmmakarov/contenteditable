module Contenteditable
  # we're depending on the host app having defined ApplicationController
  # this allows us to call methods on a method on the host app's application
  # controller to authorize updating translations
  #   http://bibwild.wordpress.com/2012/05/10/the-semi-isolated-rails-engine/
  class ContenteditableController < ApplicationController
  end
end
