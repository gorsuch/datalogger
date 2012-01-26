# DataLogger (alpha - API should be considered unstable)
A simple structured data logger.  Pass it a hash, and it takes care of storing it to the data sink of your choice (currently stdout, though plugins are on the way).

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

class MyThing
  extend DataLogger
  
  def self.do_something
    log(action: 'do_something') do
	  # code goes here
	end  
  end
end
```

