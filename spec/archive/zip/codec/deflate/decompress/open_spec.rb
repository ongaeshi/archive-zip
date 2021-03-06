# encoding: UTF-8
require File.dirname(__FILE__) + '/../../../../../../spec_helper'
require File.dirname(__FILE__) + '/../fixtures/classes'
require 'archive/zip/codec/deflate'
require 'archive/support/binary_stringio'

describe "Archive::Zip::Codec::Deflate::Decompress.open" do
  it "returns a new instance when run without a block" do
    d = Archive::Zip::Codec::Deflate::Decompress.open(BinaryStringIO.new)
    d.class.should == Archive::Zip::Codec::Deflate::Decompress
    d.close
  end

  it "executes a block with a new instance as an argument" do
    Archive::Zip::Codec::Deflate::Decompress.open(BinaryStringIO.new) do |decompressor|
      decompressor.class.should == Archive::Zip::Codec::Deflate::Decompress
    end
  end

  it "closes the object after executing a block" do
    d = Archive::Zip::Codec::Deflate::Decompress.open(BinaryStringIO.new) do |decompressor|
      decompressor
    end
    d.closed?.should.be_true
  end
end
