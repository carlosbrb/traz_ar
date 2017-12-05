module TrazAr
  class Client
    attr_accessor :client, :config
    def initialize
      @client = Savon.client(wsse_auth: [config.wsse_user, config.wsse_password],
                             filters: [:arg1],
                             wsdl: config.service_wsdl,
                             endpoint: config.service_url,
                             ssl_verify_mode: :none)
    end
  end

  def config
    TrazAr::Configuration
  end
end
