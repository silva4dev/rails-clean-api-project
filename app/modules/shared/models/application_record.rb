module Shared
  module Models
    class ApplicationRecord < ActiveRecord::Base
      self.abstract_class = true
    end
  end
end
