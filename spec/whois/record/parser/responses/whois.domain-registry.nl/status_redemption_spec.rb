# encoding: utf-8

# This file is autogenerated. Do not edit it manually.
# If you want change the content of this file, edit
#
#   /spec/fixtures/responses/whois.domain-registry.nl/status_redemption.expected
#
# and regenerate the tests with the following rake task
#
#   $ rake spec:generate
#

require 'spec_helper'
require 'whois/record/parser/whois.domain-registry.nl.rb'

describe Whois::Record::Parser::WhoisDomainRegistryNl, "status_redemption.expected" do

  subject do
    file = fixture("responses", "whois.domain-registry.nl/status_redemption.txt")
    part = Whois::Record::Part.new(:body => File.read(file))
    described_class.new(part)
  end

  describe "#status" do
    it do
      subject.status.should == :redemption
    end
  end
  describe "#available?" do
    it do
      subject.available?.should == false
    end
  end
  describe "#registered?" do
    it do
      subject.registered?.should == true
    end
  end
  describe "#created_on" do
    it do
      subject.created_on.should == nil
    end
  end
  describe "#updated_on" do
    it do
      subject.updated_on.should == nil
    end
  end
  describe "#expires_on" do
    it do
      lambda { subject.expires_on }.should raise_error(Whois::PropertyNotSupported)
    end
  end
  describe "#nameservers" do
    it do
      subject.nameservers.should be_a(Array)
      subject.nameservers.should == []
    end
  end
  describe "#response_throttled?" do
    it do
      subject.response_throttled?.should == false
    end
  end
  describe "#response_unavailable?" do
    it do
      subject.response_unavailable?.should == false
    end
  end
end
