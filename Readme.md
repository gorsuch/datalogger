# DataLogger
A simple structured data logger.  Pass it a hash, and it takes care of storing it to the data sink of your choice (defaulting to stdout).

## Usage
```ruby
logger = DataLogger::Logger.new('myapp')
logger.log a: 1, b: 2, c: 3
```

This will generate a log message to stdout that looks like so:

```
myapp a=1 b=2 c=3
```
