require "datalogger/version"
require "datalogger/logger"
require "datalogger/sinks/stdout"

module DataLogger
  def datalogger
    Logger.global_logger
  end
  
  def log(data, &blk)
    datalogger.log(data, &blk)          
  end
end