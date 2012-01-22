require 'minitest/spec'
require 'minitest/autorun'

require 'datalogger'

describe DataLogger::Logger do
  it "must respond to component" do
    l = DataLogger::Logger.new
    l.respond_to?(:component).must_equal(true)
  end

  it "must set component to 'app' by default" do
    l = DataLogger::Logger.new
    l.component.must_equal('app')
  end

  it "must allow for component to be set" do
    l = DataLogger::Logger.new('non-default')
    l.component.must_equal('non-default')
  end

  describe "puts" do
    it "must be an alias for log" do
      l = DataLogger::Logger.new
      l.method(:log).must_equal l.method(:puts)
    end
  end
end
