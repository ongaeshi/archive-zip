# encoding: UTF-8
require File.dirname(__FILE__) + '/../../../../../../spec_helper'
require File.dirname(__FILE__) + '/../fixtures/classes'
require 'archive/zip/codec/null_encryption'

describe "Archive::Zip::Codec::NullEncryption::Decrypt#read" do
  it "calls the read method of the delegate" do
    delegate = mock('delegate')
    delegate.should_receive(:read).and_return(nil)
    delegate.should_receive(:close).and_return(nil)
    Archive::Zip::Codec::NullEncryption::Decrypt.open(delegate) do |d|
      d.read
    end
  end

  it "passes data through unmodified" do
    NullEncryptionSpecs.encrypted_data do |ed|
      Archive::Zip::Codec::NullEncryption::Decrypt.open(ed) do |d|
        d.read.should == NullEncryptionSpecs.test_data
      end
    end
  end
end
