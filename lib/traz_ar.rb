require "traz_ar/version"
require "traz_ar/configuration"

module TrazAr
  class << self
    attr_accessor :configuration
  end

  def self.configuration
    @configuration || Configuration.new
  end

  def self.reset
    @configuration = Configuration.new
  end

  def self.configure
    yield(configuration)
  end
end
