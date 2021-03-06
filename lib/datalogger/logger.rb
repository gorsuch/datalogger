module DataLogger
  class Logger
    attr_accessor :component, :sinks
        
    def self.global_logger
      @global_logger ||= new
    end
    
    def self.component=(component)
      global_logger.component = component
    end
    
    def self.log(data, &blk)
      global_logger.log(data, &blk)
    end
        
    def initialize(component='app')
      self.component = component
      self.sinks = []
      self.sinks << Sinks::STDOUT.new
    end

    def log(data, &blk)
      if data.kind_of?(String)
        data = { message: data }
      end
   
      if blk
        ret = nil
        start = Time.now
        log_to_sinks(data.merge at: 'start')
        ret = yield
        log_to_sinks(data.merge at: 'finish', elapsed: (Time.now - start))
        ret
      else
        log_to_sinks(data)
        nil
      end
    end
    
    def log_to_sinks(data)
      self.sinks.each do |sink|
        sink.log(self.component, data)
      end
    end    
  end
end