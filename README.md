# `Desplatter`

## What is it?
Desplatter is a gem that simplifies the common pattern often found in command objects of passing in arguments and then immediately assigning them to instance variables.

## Getting Started

1. Add the gem to your Gemfile `gem 'desplatter', :git => 'https://github.com/workplacearcade/desplatter'`
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
  prepend Arcade::Desplatter

  def initialize(name, age, email)
    desplat
  end
end
```

## TO-DO
- [ ] Benchmark gem performance
- [ ] Accept array of variable to ignore
