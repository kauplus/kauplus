module Kauplus
  
  #
  # Constants
  #
  
  #
  # Conditions of a product
  #
  CONDITION = {
    :new      => 1, # Novo
    :used     => 2, # Usado
    :seminew  => 3  # Seminovo
  }
  
  #
  # Available shipping methods
  #
  SHIPPING = {
    :no   => 1, # Sem frete
    :free => 2, # Frete grátis
    :paid => 3  # Frete pago
  }
  
  #
  # Paid shipping methods
  #
  PAID_SHIPPING = {
    :fixed            => 1, # Frete fixo
    :additional_fixed => 2, # Frete adicional com valor fixo
    :correios         => 3  # Frete dos correios
  }
  
  #
  # Shipping package formats
  #  
  PACKAGE_FORMAT = {
    :box      => 1, # Caixa/Pacote
    :cylinder => 2 # Rolo/Prisma
  }
  
  #
  # Correios Web Services types and codes
  #
  CORREIOS_SERVICES_TYPES = {
    :pac=>[41106, "PAC sem contrato"],
    :sedex=>[40010, "SEDEX sem contrato"],
    :sedex_a_cobrar=>[40045, "SEDEX a Cobrar, sem contrato"],
    :sedex_a_cobrar_com_contrato=>[40126, "SEDEX a Cobrar, com contrato"],
    :sedex_10=>[40215, "SEDEX 10, sem contrato"],
    :sedex_hoje=>[40290, "SEDEX Hoje, sem contrato"],
    :sedex_com_contrato_1=>[40096, "SEDEX com contrato"],
    :sedex_com_contrato_2=>[40436, "SEDEX com contrato"],
    :sedex_com_contrato_3=>[40444, "SEDEX com contrato"],
    :sedex_com_contrato_4=>[40568, "SEDEX com contrato"],
    :sedex_com_contrato_5=>[40606, "SEDEX com contrato"],
    :e_sedex_com_contrato=>[81019, "e-SEDEX, com contrato"],
    :pac_com_contrato=>[41068, "PAC com contrato"],
    :e_sedex_com_contrato_grupo_1=>[81868, "(Grupo 1) e-SEDEX, com contrato"],
    :e_sedex_com_contrato_grupo_2=>[81833, "(Grupo 2) e-SEDEX, com contrato"],
    :e_sedex_com_contrato_grupo_3=>[81850, "(Grupo 3) e-SEDEX, com contrato"]
  }
  
  CORREIOS_SERVICES_CODES = Hash[CORREIOS_SERVICES_TYPES.map {|k,v| [ v[0], [k, v[1]] ] } ]   
  
  #
  # Order possible statuses
  #
  ORDER_STATUS = {
    :order_received               => 1,
    :waiting_payment_confirmation => 2,
    :payment_confirmed            => 3,
    :shipped                      => 4,
    :canceled                     => 5,
    :finished                     => 6
  }
    
  #
  # Possible events for an order
  #
  ORDER_EVENT = {
    :receive_order    => 1,
    :wait_payment     => 2,
    :confirm_payment  => 3,
    :reject_payment   => 4,
    :confirm_shipping => 5,
    :confirm_delivery => 6
  }
  
  #
  # Wizard status
  #
  WIZARD_STATUS = {
    :store_created    => 1,
    :store_setup      => 2,
    :shipping_setup   => 3,
    :categories_setup => 4,
    :products_setup   => 5,
    :store_active     => 6
  }
  
end