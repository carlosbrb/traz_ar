require 'savon'
require 'traz_ar/version'
require 'traz_ar/configuration'
require 'traz_ar/client'
# Main module
module TrazAr
  class << self
    attr_writer :configuration
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
