require 'singleton'

module Kauplus

  def self.config
    Kauplus::Config.instance
  end

  #
  # Private.
  #
  private
  
  class Config
    include Singleton
  
    attr_accessor :api_key, :process_response
    
    #
    # Private methods.
    #
    private
    
    def initialize
      # load YAML config if possible
      if defined? Rails
        path = "#{Rails.root}/config/kauplus.yml"
        env = Rails.env
      else
        path = "#{Dir.pwd}/config/kauplus.yml"
        env = 'kauplus'
      end
      conf = File.exists?(path) ? YAML.load_file(path)[env] : {}
      self.api_key = conf['api_key']
      self.process_response = conf['process_response'] || true
    end
  
  end

end