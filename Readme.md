# DataLogger
A simple structured data logger.  Pass it a hash, and it takes care of storing it to the data sink of your choice (currently stdout, though plugins are on the way).

## Usage
```ruby
logger = DataLogger::Logger.new('myapp')
logger.log a: 1, b: 2, c: 3
```

This will generate a log message to stdout that looks like so:

```
myapp a=1 b=2 c=3
```

Or, perhaps you'd like to log how long it takes to perform a given action:

```ruby
logger = DataLogger::Logger.new('myapp')
logger.log(event: 'create_user') do
  # code to create some user 
end
```

This will generate a message that looks something like so:

```
myapp action=create_user at=start
myapp action=create_user at=finish elapsed=0.003116
```
