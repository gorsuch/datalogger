module DataLogger
  class STDOUTSink
    def initialize(sync=true)
      STDOUT.sync = sync
    end

    def stringify_data(data)
      data.inject("") { |s, (k,v)| s + "#{k}=#{v} " }.strip
    end

    def log(component, data)
      puts "#{component} #{stringify_data(data)}"
    end
  end
end
