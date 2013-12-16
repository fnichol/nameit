# -*- encoding: utf-8 -*-

if ENV['SIMPLECOV']
  require 'simplecov'
  SimpleCov.adapters.define 'gem' do
    command_name 'Specs'

    add_filter '.gem/'
    add_filter '/spec/'

    add_group 'Binaries', '/bin/'
    add_group 'Libraries', '/lib/'
  end
  SimpleCov.start 'gem'
end

require 'minitest/autorun'
require 'nameit'

describe Nameit do
end
