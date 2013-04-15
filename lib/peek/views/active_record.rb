module Peek
  module Views
    class ActiveRecord < View
      def context
        Hash.new.tap do |ctx|
          ctx[:activerecord] = Hash.new.tap do |ar|
            ar[:object_count] = ActiveRecord::Base.obj_count
            ar[:object_types] = ActiveRecord::Base.obj_types
          end
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
