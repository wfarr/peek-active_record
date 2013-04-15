require "atomic"

module Peek
  module Views
    class ActiveRecord < View
      def result
        { :objects => ::ActiveRecord::Base.obj_count.value }
      end

      def context
        Hash.new.tap do |ctx|
          ctx[:object_count] = ::ActiveRecord::Base.obj_count.value
          ctx[:object_types] = ::ActiveRecord::Base.obj_types
        end
      end

      private

      def setup_subscribers
        before_request do
          ::ActiveRecord::Base.tap { |ar| ar.obj_count = Atomic.new(0) }
        end
      end
    end
  end
end
