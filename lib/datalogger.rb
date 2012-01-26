require "datalogger/version"
require "datalogger/logger"
require "datalogger/sinks/stdout"

module DataLogger
  def log(data, &blk)
    Logger.global_logger.log(data, &blk)          
  end
end
