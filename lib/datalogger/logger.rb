module DataLogger
  class Logger
    attr_accessor :component, :sinks

    def initialize(component='app')
      self.component = component
      self.sinks = []
      self.sinks << STDOUTSink.new
    end

    def log(data)
      self.sinks.each do |sink|
        sink.log(component, data)
      end
    end
  end
end
