# -*- encoding: utf-8 -*-

require "nameit/version"

class Nameit

  def initialize(options = {})
    @sample_opts = Hash.new
    @sample_opts[:random] = options.fetch(:random) unless options[:random].nil?
  end

  def generate
    "#{random_adjective}-#{random_noun}"
  end

  def self.generate(options = {})
    options = options.dup
    new(:random => options.delete(:random)).generate
  end

  private

  attr_reader :sample_opts

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
end
