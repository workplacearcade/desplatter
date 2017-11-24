# Desplatter

## What is it?
Desplatter is a gem that simplifies the common pattern often found in command objects of passing in arguments and then immediately assigning them to instance variables.

## Getting Started

1. Add the following line your Gemfile `gem 'desplatter', git: 'https://github.com/workplacearcade/desplatter'`
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
    desplat binding
  end
end
```

## Performance

The results of running the benchmarking tests in `benchmark.rb` produce the following:

```
  0.670000   0.010000   0.680000 (  0.082379)
  5.060000   0.020000   5.080000 (  2.738410)
```

As you can see, desplatter is currently noticably slower than the standard ruby way of writing a command object. That being said, the performance is currently a WIP and hopefully the convenience provided by the gem outweighs the performance detriment.

## TO-DO
- [ ] Improve performance in setting attr_accessors
- [ ] Make desplat method available without prepending
