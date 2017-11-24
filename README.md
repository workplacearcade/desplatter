# Desplatter

## What is it?
Desplatter is a gem that simplifies the common pattern often found in command objects of passing in arguments and then immediately assigning them to instance variables.

## Getting Started

1. Add the gem to your Gemfile `gem 'desplatter', git: 'https://github.com/workplacearcade/desplatter'`
2. Run `bundle install`

## Usage

If we take a commonly found example such as:

```ruby
class Command
  attr_accessor :name, :age, :email

  def initialize(name, age, email)
    @name = name
    @age = age
    @email = email
  end
end
```

We can simplify it as the following:

```ruby
class Command
  prepend Desplatter

  def initialize(name, age, email)

  end

  desplat :initialize
end
```

## Performance

The results of running the benchmarking tests in `benchmark.rb` produce the following:

```
  0.670000   0.010000   0.680000 (  0.672676)
  5.060000   0.020000   5.080000 (  5.108522)
```

While we can see that the core ruby method of doing it is notably faster, in the context of a command object the performance difference is trivial and the convenience is worth it.

## TO-DO
- [x] Benchmark gem performance
- [ ] Accept array of variable to ignore
