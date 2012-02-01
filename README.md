# Delegate-class

Using the default ruby delegate library, this gem is used to wrap the class _AND_ instance methods of another class.
(_Though I still don't know the real usage of it_)

You may want to use it like this:

##Usage

I found it can be used on these situations.


Lets say you are using Rails and has the model:

```ruby
   
class User < ActiveRecord::Base
end

```

And then you have an author delegator class, modified to make things like _#form_for_

```ruby
require "delegate"

class Author < SimpleDelegator
  def class
    __getojb__.class
  end

  def bookmates
    User.find(1)
  end

  def name
   super + "!"
  end
end

```

IMO, there are two bad things in these code:

 1. Redefine class
 2. Referencing the class you should be delegating

You may change it to:

```ruby
require "delegate/class"

class Author < ClassDelegator(User)
  def bookmates
    self.class.find(1)
  end

  def name
   super + "!"
  end
end

```

Now, you are delegating the instance and class methods to the wrapped class/object

## Instalation

[![Build Status](https://secure.travis-ci.org/bltavares/delegate-class.png)](http://travis-ci.org/bltavares/delegate-class)

It's is simple.

Add to your gem file

```ruby
    gem "delegate/class"
```

And run

```bash
    bundle install
```

Hope you like it (:
