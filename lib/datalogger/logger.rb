module DataLogger
  class Logger
    attr_accessor :component

    def initialize(component)
      self.component = component
    end

    def log(data)
      stdout = STDOUTSink.new
      stdout.log(component, data)
    end
  end
end
