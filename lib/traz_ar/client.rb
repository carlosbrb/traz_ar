require 'pry'
module TrazAr
  class Client
    attr_accessor :client, :config
    def initialize(config = Configuration.new)
      @config = config
      @client = Savon.client(wsse_auth: [config.wsse_user, config.wsse_password],
                             filters: [:arg1],
                             wsdl: config.service_wsdl,
                             endpoint: config.service_url,
                             ssl_verify_mode: :none)
    end

    def actions
      @client.operations
    end

    def unconfirmed_transactions_pages
      call_action(:get_transacciones_no_confirmadas)[:cant_paginas]
    end

    def call_action(action_name, args = {})
      response_key = action_name.to_s + '_response'
      response = @client.call(
        action_name,
        message: transaction_filters(args)
      )
      response.to_hash[response_key.to_sym][:return]
    end

    def transaction_filters(args = {})
      filter = { arg0: @config.service_user, arg1: @config.service_password }
      unconfirmed_transactions_parameters.each do |key, value|
        filter[key.to_sym] = args[value.to_sym] unless args[value.to_sym].blank?
      end
      filter
    end

    def unconfirmed_transactions_parameters
      { arg2:  :id_transaccion_global,
        arg3:  :gln_informador,
        arg4:  :gln_origen,
        arg5:  :gln_destino,
        arg6:  :gtin,
        arg7:  :evento_id,
        arg8:  :fecha_transaccion_desde,
        arg9:  :fecha_transaccion_hasta,
        arg10: :fecha_operacion_desde,
        arg11:  :fecha_operacion_hasta,
        arg12:  :fecha_vencimiento_desde,
        arg13:  :fecha_vencimiento_hasta,
        arg14:  :numero_remito,
        arg15:  :numero_factura,
        arg16:  :id_estado,
        arg17:  :lote,
        arg18:  :serie,
        arg19:  :pagina,
        arg20:  :por_pagina }
    end
  end
end
