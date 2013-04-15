require "peek/extensions/active_record"

module Peek
  module Views
    class ActiveRecord < View
      def initialize options = {}
        @type_tracking = options.fetch(:type_tracking, false)

        setup_subscribers
      end

      def context
        {
          :object_count => object_count,
          :object_types => object_types
        }
      end


      private
      def object_count
        ::ActiveRecord::Base.obj_count.value
      end

      def object_types
        Hash[::ActiveRecord::Base.obj_types.sort_by(&:last).reverse]
      end

      def setup_subscribers
        before_request do
          ::ActiveRecord::Base.tap do |ar|
            ar.obj_count = Atomic.new(0)
            ar.obj_types = Hash.new(0)
            ar.obj_types_enabled = @type_tracking
          end
        end
      end
    end
  end
end
