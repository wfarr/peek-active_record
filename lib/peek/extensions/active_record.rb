require "active_record"

class ActiveRecord::Base
  class << self
    attr_accessor :obj_count, :obj_types, :obj_types_enabled
  end

  self.obj_count = 0
  self.obj_types = Hash.new(0)
  self.obj_types_enabled = false

  def initialize_with_stats *attributes
    initialize_without_stats *attributes
  ensure
    _update_object_stats
  end

  def init_with_with_stats coder
    init_with_without_stats coder
  ensure
    _update_object_stats
  end

  def initialize_dup_with_stats other
    intialize_dup_without_stats other
  ensure
    _update_object_stats
  end

  alias_method_chain :initialize, :stats
  alias_method_chain :init_with, :stats
  alias_method_chain :initialize_dup, :stats

  protected
  def _update_object_stats
    ActiveRecord::Base.obj_count += 1

    if ActiveRecord::Base.obj_types_enabled
      ActiveRecord::Base.obj_types[ self.class.name ] += 1
    end
  end
end
