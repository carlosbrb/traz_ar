require "bundler/setup"
require "traz_ar"

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.before(:all) do |c|
    TrazAr.configure do |config|
      config.wsse_user = 'testwservice'
      config.wsse_password = 'testwservicepsw'
      config.service_url = 'https://servicios.pami.org.ar/trazamed.WebService'
      config.service_wsdl = 'https://servicios.pami.org.ar/trazamed.WebService?wsdl'
      config.service_user = 'glnws'
      config.service_password = 'glnws'
    end
  end
end
