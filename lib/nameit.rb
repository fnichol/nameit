# -*- encoding: utf-8 -*-

require "nameit/version"
require "securerandom"

class Nameit

  class Random

    def rand(n = 0)
      SecureRandom.random_number(n)
    end
  end

  def initialize(options = {})
    @random = options.fetch(:random, ::Nameit::Random.new)
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

  attr_reader :max_number, :number, :random

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
    adjectives[random.rand(adjectives.size)].chomp
  end

  def random_noun
    nouns[random.rand(nouns.size)].chomp
  end

  def random_number
    "%0#{(Math.log10(max_number) + 1).to_i}d" % random.rand(max_number)
  end
end
