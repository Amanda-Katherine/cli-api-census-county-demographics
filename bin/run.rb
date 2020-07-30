#!/usr/bin/env ruby

require_relative "../config/environment.rb"
require_relative "../lib/census_data_importer.rb"
require_relative "../lib/county_data.rb"
require_relative "../lib/cli.rb"


CountyDataController.new.call