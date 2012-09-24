module Contenteditable
  class Translation < ActiveRecord::Base
    attr_accessible :key, :value
    self.table_name = "translations"
  end
end
