require "spec_helper"
require "delegate/class"


class A
  def instance_meth
    "instance meth"
  end

  def self.class_meth
    "class meth"
  end

end

class ModifiedObj < ClassDelegator(A)
  def instance_meth
    super + "!"
  end

  def self.class_meth
    super + "!"
  end
end

describe Delegate::Class, "ClassDelegator" do
  let(:a) { A.new }
  let(:obj_class) { Class.new ClassDelegator(A) }
  let(:obj) { obj_class.new a }

  describe "Istance methods" do
    it "must respond to delegated instance methods" do
      obj.must_respond_to :instance_meth
    end
    it "must delegate instance methods" do
      obj.instance_meth.must_equal a.instance_meth
    end
  end

  describe "Class methods" do
    it "must respond to delegated class methods" do
      obj_class.must_respond_to :class_meth
    end

    it "must delegate class methods" do
      obj.class.class_meth.must_equal A.class_meth
    end
  end

  describe "Modified methods" do
    let(:modified) { ModifiedObj.new a }

    it "must modify the instance method" do
      modified.instance_meth.must_equal(a.instance_meth + "!")
    end

    it "must modify the class method" do
      ModifiedObj.class_meth.must_equal(A.class_meth + "!")
    end
  end
end
