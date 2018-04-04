module TrazAr
  class Configuration
    attr_accessor :wsse_user,
                  :wsse_password,
                  :service_url,
                  :service_wsdl,
                  :service_user,
                  :service_password

    def initialize
      @wsse_user = 'testwservice'
      @wsse_password = 'testwservicepsw'
      @service_url = 'https://servicios.pami.org.ar/trazamed.WebService'
      @service_wsdl = 'https://servicios.pami.org.ar/trazamed.WebService?wsdl'
      @service_user = 'glnws'
      @service_password = 'glnws'
    end
  end
end
