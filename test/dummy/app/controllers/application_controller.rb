class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :hello_world

  contenteditable_filter :hello_world

  def hello_world

   #true
    false
    #binding.pry

  end

end
