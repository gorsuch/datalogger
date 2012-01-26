# DataLogger (alpha - API should be considered unstable)
A simple structured data logger.  Pass it a hash, and it takes care of emitting to stdout.

Inspiration largely comes from ["The Twelve-Factor App"](http://www.12factor.net/logs) by Adam Wiggins, Mark McGranaghan's ["Logs as Data"](https://github.com/relevance/clojure-conj/blob/master/2011-slides/mark-mcgranaghan-logs-as-data.pdf) talk, and various experiments at [Heroku](http://heroku.com).

## Usage
### The most obvious way:
```ruby
require 'datalogger'

logger = DataLogger::Logger.new('myapp')
logger.log a: 1, b: 2, c: 3
```

This will generate a log message to stdout that looks like so:

```
myapp a=1 b=2 c=3
```

Or, perhaps you'd like to log how long it takes to perform a given action:

```ruby
require 'datalogger'

logger = DataLogger::Logger.new('myapp')
logger.log(event: 'create_user') do
  # code to create a user 
end
```

This will generate a message that looks something like so:

```
myapp action=create_user at=start
myapp action=create_user at=finish elapsed=0.003116
```

###As a singleton:

```ruby
require 'datalogger'

DataLogger::Logger.component = 'myapp'
DataLogger::Logger.log a: 1, b: 2, c: 3
```

### Mixing in instance methods

```ruby
require 'datalogger'

DataLogger::Logger.component = 'myapp'

class MyThing
  include DataLogger
  
  def do_something
    log(action: 'do_something') do
	  # code goes here
	end  
  end
end
```

### Mixing in class methods
```ruby
require 'datalogger'

DataLogger::Logger.component = 'myapp'

class MyThing
  extend DataLogger
  
  def self.do_something
    log(action: 'do_something') do
	  # code goes here
	end  
  end
end
```

