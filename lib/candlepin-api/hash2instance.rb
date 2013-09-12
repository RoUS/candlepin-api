require('rubygems')

#
# Random module name to try to avoid conflicts.
#
module Sublime

  #
  # Superclass that turns any hashes in the argument list into
  # settings for instance variables.  If the instance variable has a
  # writer method, that's used to set the value -- otherwise it's set
  # with #instance_variable_set.
  #
  class Hash2Instance

    #
    # Any hashes in the argument list are extracted, and each
    # key/value pair is treated as a potential setting for an instance
    # variable.  If there is a writer method for the key, it is called
    # to set the instance variable with the given value.
    #
    # @param [Array] args_p
    #   Variable-length argument list.
    # @return [nil]
    #
    def initialize(*args_p)
     args_p.select { |o| o.kind_of?(Hash) }.each do |hsh_p|
        hsh_p.each do |k,v|
          ivwriter	= (k.to_s + '=').to_sym
          ivname	= ('@' + k.to_s).to_sym
          if (self.class.method_defined?(ivwriter))
            self.send(ivwriter, v)
          else
            self.instance_variable_set(ivname, v)
          end
        end
      end
    end                         # def initialize

  end                           # class Hash2Instance

end                             # module Sublime
