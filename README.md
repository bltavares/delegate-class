# Delegate-class

Using the default ruby delegate library, this gem is used to wrap the class _AND_ instance methods of another class.
(_Though I still don't know the real usage of it_)

You may want to use it like this:

    require "delegate/class"

    class A
     def self.class_meth
      :class_meth
     end

     def instance_meth
      :instance_meth
     end
    end
    
    class B < ClassDelegator(A)
     def self.class_meth
      super.to_s + "!"
     end
    end
    
    

Hope you like it (:
