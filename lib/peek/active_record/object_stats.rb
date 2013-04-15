require "active_support/concern"

module Peek
  module ActiveRecord
    module ObjectStats
      extend ActiveSupport::Concern

      included do
        after_initialize :_update_object_stats
      end
    end
  end
end
