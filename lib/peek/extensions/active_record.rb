require "active_record"
require "atomic"

require "peek/active_record/object_stats"

class ActiveRecord::Base
  class << self
    attr_accessor :obj_count, :obj_types, :obj_types_enabled
  end

  self.obj_count = Atomic.new(0)
  self.obj_types = Hash.new(0)
  self.obj_types_enabled = false

  protected
  def _update_object_stats
    ActiveRecord::Base.obj_count.update { |val| val + 1 }

    if ActiveRecord::Base.obj_types_enabled
      ActiveRecord::Base.obj_types[self.class.name] += 1
    end
  end
end
