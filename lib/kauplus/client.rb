require 'active_support/core_ext'
require 'rest_client'

module Kauplus
  
  class Client
    
    attr_accessor :resource
    
    #
    # Creates a new client with its resource_method.
    #
    def initialize args = {}
      self.resource = args[:resource] || ''
    end
    
    #
    # Enables dynamic programming for the generation of HTTP methods.
    #
    def method_missing(method_name, *args)
      payload = Kauplus::Client.authenticate_payload(args.first)
      if method_name.match(/(get|post|multipart_post|put|delete|head)_(.*)/)
        Kauplus::Client.send($1, "#{@resource}/#{$2}", payload)
      else
        Kauplus::Client.get("#{@resource}/#{method_name}", payload)
      end
    end
    
    #
    # Private methods.
    #
    private
    
    #
    # Sends an HTTP GET Request to the Kauplus Web Services
    # and parses the json response.
    #
    def self.get(resource_method, payload = {})
      url = payload.empty? ? url_for_resource_method(resource_method) : "#{url_for_resource_method(resource_method)}?#{payload.to_query}"
      parse_json RestClient.get(url)
    end

    #
    # Sends an HTTP POST Request to the Kauplus Web Services
    # and parses the json response.
    #
    def self.post(resource_method, payload)
      parse_json RestClient.post(url_for_resource_method(resource_method), Params.generate(payload))        
    end

    #
    # Sends an HTTP PUT Request to the Kauplus Web Services
    # and parses the json response.
    #
    def self.put(resource_method, payload)
      parse_json RestClient.put(url_for_resource_method(resource_method), Params.generate(payload))
    end

    #
    # Sends an HTTP DELETE Request to the Kauplus Web Services
    # and parses the json response.
    #
    def self.delete(resource_method, payload = {})
      parse_json RestClient.delete("#{url_for_resource_method(resource_method)}?#{payload.to_query}")
    end

    #
    # Sends an HTTP HEAD Request to the Kauplus Web Services.
    #
    def self.head(resource_method, payload = {})
      RestClient.head("#{url_for_resource_method(resource_method)}?#{payload.to_query}")
    end
    
    #
    # Authenticates the payload by adding the api_key argument to it.
    #
    def self.authenticate_payload(payload)
      if payload.blank?
        payload = {}
      end
      if payload[:api_key].blank? and payload['api_key'].blank?
        payload[:api_key] = Kauplus.config.api_key
      end
      payload
    end
    
    #
    # Returns the URL for consuming a specific resource_method.
    #
    def self.url_for_resource_method(resource_method)
      "https://shop.kauplus.com.br/#{resource_method}"     
    end
    
    #
    # Parses the json response.
    # Raises a Kauplus::Error if the response is invalid and raise errors is active.
    #
    def self.parse_json body
      parsed_response = JSON.load(body)
      if Kauplus.config.process_response
        if parsed_response['code'].to_s[0] == '6'
          if parsed_response['summary']
            parsed_response = {'data' => parsed_response['data'], 'summary' => parsed_response['summary']}
          else
            parsed_response = parsed_response['data']
          end
        else
          raise Kauplus::Error.new(
                    :code => parsed_response['code'],
                    :error => parsed_response['error'],
                    :messages => parsed_response['messages']
                    )
        end
      end
      parsed_response
    end
    
  end
  
end