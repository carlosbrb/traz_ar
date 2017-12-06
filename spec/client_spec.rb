RSpec.describe '#Client' do
  before(:each) do
    @client = TrazAr::Client.new
  end

  it 'can be instantiated' do
    expect(@client).to be_a(TrazAr::Client)
  end

  it 'get right webservice actions' do
    expect(@client.actions).to be_eql(%i[ send_medicamentos_fraccion
                                          send_cancelac_transacc
                                          send_confirma_transacc
                                          get_transacciones_no_confirmadas
                                          send_alerta_transacc
                                          send_medicamentos
                                          get_consulta_stock
                                          get_envios_propios_alertados
                                          send_cancelac_transacc_parcial
                                          get_catalogo_electronico_by_gtin
                                          get_transacciones_ws
                                          get_catalogo_electronico_by_gln
                                          send_medicamentos_dh_serie ])
  end

  it 'can get non-confirmed transactions pages' do
    expect(@client.unconfirmed_transactions_pages).to eq('1')
  end
end
