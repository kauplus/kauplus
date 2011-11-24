module Kauplus
  
  #
  # Kauplus.api references to Kauplus::API
  #
  def self.api
    API
  end
  
  class API
    
    
    #
    # Enables dynamic programming for the generation of HTTP resources.
    #
    def self.method_missing(method_name, *args)
      Client.new :resource => method_name
    end
    
  end
  
end