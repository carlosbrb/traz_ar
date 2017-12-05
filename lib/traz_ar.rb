require 'savon'
require 'traz_ar/version'
require 'traz_ar/configuration'
require 'traz_ar/client'
# Main module
module TrazAr
  class << self
    attr_accessor :configuration
    # @client = TrazAr::Client.new
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

  def actions
    @client.actions
  end
end
