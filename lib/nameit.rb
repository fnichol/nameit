# -*- encoding: utf-8 -*-

require "nameit/version"

class Nameit

  def initialize(options = {})
    @sample_opts = Hash.new
    @sample_opts[:random] = options.fetch(:random) unless options[:random].nil?
    @number = options.fetch(:number, false)
    @max_number = [options.fetch(:max_number, 999), 1].max
  end

  def generate
    name = "#{random_adjective}-#{random_noun}"
    name += "-#{random_number}" if number
    name
  end

  def self.generate(options = {})
    new(options).generate
  end

  private

  attr_reader :max_number, :number, :sample_opts

  def adjectives
    @adjectives ||= IO.readlines(data_file("nameit-adjectives.txt"))
  end

  def data_file(name)
    File.join(File.dirname(__FILE__), "..", "data", name)
  end

  def nouns
    @nouns ||= IO.readlines(data_file("nameit-nouns.txt"))
  end

  def random_adjective
    adjectives.sample(1, sample_opts).first.chomp
  end

  def random_noun
    nouns.sample(1, sample_opts).first.chomp
  end

  def random_number
    "%0#{(Math.log10(max_number) + 1).to_i}d" % rand(max_number)
  end
end
