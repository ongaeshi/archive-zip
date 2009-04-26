require File.dirname(__FILE__) + '/../../../../../../spec_helper'
require File.dirname(__FILE__) + '/../fixtures/classes'
require 'archive/zip/codec/store'
require 'stringio'

describe "Archive::Zip::Codec::Store::Compress.new" do
  it "returns a new instance" do
    c = Archive::Zip::Codec::Store::Compress.new(StringIO.new)
    c.class.should == Archive::Zip::Codec::Store::Compress
    c.close
  end
end