module FieldManagement

  def self.included klass
    klass.class_eval do
      include InstanceMethods
      extend ClassMethods
    end
  end
  
  module ClassMethods

    def fields(group = nil)
      # if we are asking for a particular subset
      return @fields[group] if group
      
      # No group was asked for, so we flatten the groups into a single set.
      # ... beware, tuples should be unique!
      f = Set.new
      @fields.each {|key, tuples|
        tuples.each {|t| f << t}
      }
      
      f.to_a
    end
    
    def add_fields(group, *tuples)
      @fields ||= {}
      @fields[group] = tuples
    end
  end
  
  module InstanceMethods
  end
  
end