module DataLogger
  class Logger
    attr_accessor :component

    def initialize(component)
      self.component = component
    end

    def stringify_data(data)
      data.inject("") { |s, (k,v)| s + "#{k}=#{v} " }.strip
    end

    def log(data)
      puts "#{self.component} #{stringify_data(data)}"
    end
  end
end
