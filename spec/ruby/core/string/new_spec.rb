require File.expand_path('../../../spec_helper', __FILE__)
require File.expand_path('../fixtures/classes', __FILE__)

describe "String.new" do
  it "returns an instance of String" do
    str = String.new
    str.should be_kind_of(String)
  end

  it "returns a fully-formed String" do
    str = String.new
    str.size.should == 0
    str << "more"
    str.should == "more"
  end

  it "returns a new string given a string argument" do
    str1 = "test"
    str = String.new(str1)
    str.should be_kind_of(String)
    str.should == str
    str << "more"
    str.should == "testmore"
  end

  it "returns an instance of a subclass" do
    a = StringSpecs::MyString.new("blah")
    a.should be_kind_of(StringSpecs::MyString)
    a.should == "blah"
  end

  it "is called on subclasses" do
    s = StringSpecs::SubString.new
    s.special.should == nil
    s.should == ""

    s = StringSpecs::SubString.new "subclass"
    s.special.should == "subclass"
    s.should == ""
  end

  it "raises TypeError on inconvertible object" do
    lambda { String.new 5 }.should raise_error(TypeError)
    lambda { String.new nil }.should raise_error(TypeError)
  end

  ruby_version_is "1.9" do
    it "returns a binary String" do
      String.new.encoding.should == Encoding::BINARY
    end
  end
end
