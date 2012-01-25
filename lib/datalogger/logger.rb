module DataLogger
  class Logger
    attr_accessor :component, :sinks

    def initialize(component='app')
      self.component = component
      self.sinks = []
      self.sinks << Sinks::STDOUT.new
    end

    def log_to_sinks(data)
      self.sinks.each do |sink|
        sink.log(self.component, data)
      end
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

    alias_method :puts, :log
  end
end
