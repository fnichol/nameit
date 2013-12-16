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

class UnRandom

  def self.rand(x = 0)
    @values.nil? ? 2 : @values.next
  end

  def self.values=(array)
    @values = Array(array).cycle
  end
end

describe Nameit do

  describe ".generate" do

    before { UnRandom.values = [2, 2, 3, 3] }

    it "returns random <adjective>-<noun> names" do
      Nameit.generate(:random => UnRandom).must_equal "abandoned-achieve"
      Nameit.generate(:random => UnRandom).must_equal "abashed-achiever"
    end
  end

  describe "#generate" do

    before { UnRandom.values = [55, 55, 105, 105] }

    it "returns random <adjective>-<noun> names" do
      nameit = Nameit.new(:random => UnRandom)
      nameit.generate.must_equal "ambiguous-ball"
      nameit.generate.must_equal "blue-book"
    end
  end
end
