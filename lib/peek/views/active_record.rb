module Peek
  module Views
    class ActiveRecord < View
      def result
        { :objects => ::ActiveRecord::Base.obj_count }
      end

      def context
        Hash.new.tap do |ctx|
          ctx[:object_count] = ::ActiveRecord::Base.obj_count
          ctx[:object_types] = ::ActiveRecord::Base.obj_types
        end
      end

      private

      def setup_subscribers
        before_request do
          ::ActiveRecord::Base.tap { |ar| ar.obj_count = 0 }
        end
      end
    end
  end
end
