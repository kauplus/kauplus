module Kauplus
  class Error < StandardError
    
    attr_accessor :code, :error, :messages
    
    def initialize(args = {})
      @code = args[:code]
      @error = args[:error]
      @messages = args[:messages]
      super(@error)
    end
    
    def to_s
      "(#{@code}) #{super}"
    end
    
  end
end