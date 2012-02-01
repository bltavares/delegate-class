require "delegate"
require "delegate/class/kernel"

module Delegate
  module Class
    #borrowed from Delegate.delegating_block
    def self.delegate_block(mid, target)
      lambda do |*args, &block|
      begin
        target.__send__(mid, *args, &block)
      ensure
        $@.delete_if {|t| /\A#{Regexp.quote(__FILE__)}:#{__LINE__-2}:/ =~ t} if $@
      end
      end
    end
  end
end

def ClassDelegator(superclass)
  klass = DelegateClass(superclass)
  klass_methods = superclass.public_methods - klass.public_methods

  klass_methods.each do |meth|
    klass.define_singleton_method(meth,Delegate::Class.delegate_block(meth, superclass))
  end

  klass
end

