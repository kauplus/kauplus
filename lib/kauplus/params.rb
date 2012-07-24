module Kauplus
  
  #
  # Deals with post/put parameters, generating parameters with
  # the correct keys. If our pull request to RestClient is accepted, 
  # this won't be needed anymore.
  #
  class Params

    def self.generate payload
      (payload.is_a? Hash) ? generate_params_list(payload) : payload
    end
    
    def self.generate_params_list payload
      parameters = []
      # Build array with all parameter values
      values = extract_values(payload)
      
      # Generate query string with the correct keys
      # and extract each key-value pair of the form 
      # "name=value" as key_value
      payload.to_query.split('&').each do |key_value|
        unless key_value.blank?
          key, value = key_value.split('=')
          index = values.find_index{|v| v.to_query('').split('=')[1] == value}
          if index
            parameters << [URI.unescape(key), values.delete_at(index)]
          else
            raise "Could not find representation for #{URI.unescape(key)}"
          end
        end
      end
      parameters
    end
    
    def self.extract_values(payload, values=[])
      if payload.is_a? Hash
        payload.each {|k, v| extract_values(v, values)}
      elsif payload.is_a? Array
        payload.each {|v| extract_values(v, values)}
      else
        values << payload
      end
      values
    end
    
  end
  
end