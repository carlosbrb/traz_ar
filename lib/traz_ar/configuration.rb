module TrazAr
  class Configuration
    attr_accessor :wsse_user,
                  :wsse_password,
                  :service_url,
                  :service_wsdl,
                  :service_user,
                  :service_password

    def initialize
      @wsse_user = nil
      @wsse_password = nil
      @service_url = nil
      @service_wsdl = nil
      @service_user = nil
      @service_password = nil
    end
  end
end
