#!/usr/bin/env ruby
#
#  Created by Rick Bradley on 2007-10-03.
#  Copyright (c) 2007. All rights reserved.

require File.dirname(__FILE__) + '/../../spec_helper'

require 'puppet/network/http'

describe Puppet::Network::HTTP do
    it "should return the webrick HTTP server class when asked for a webrick server" do
        Puppet::Network::HTTP.server_class_by_type(:webrick).should be(Puppet::Network::HTTP::WEBrick)
    end
    
    it "should return the mongrel HTTP server class when asked for a mongrel server" do
        Puppet::Network::HTTP.server_class_by_type(:mongrel).should be(Puppet::Network::HTTP::Mongrel)
    end
      
    it "should return an error when asked for an unknown server" do
        Proc.new { Puppet::Network::HTTP.server_class_by_type :foo }.should raise_error(ArgumentError)
    end
end