[![Build Status](https://secure.travis-ci.org/travisjeffery/validates_phone_number.png)](http://travis-ci.org/travisjeffery/validates_phone_number)

# Validates Phone Number

`validates_phone_number` adds validation methods to ActiveModel for validating
phone numbers.

### Basic Usage

Given a User model with a phone number attribute of `phone number`
that's a string, see if a given record has a valid phone number like so:

```ruby
class Person < ActiveRecord::Base
  validates :mobile, :phone_number => true
end
```

By default, both 10 and 7 digit numbers are valid.

## Options

### Seven Digits

Example: 555-5555, 555.5555, 1234567, etc.

```ruby
class Person < ActiveRecord::Base
  validates :mobile, :phone_number => {:seven_digits => true}
end

```
### Ten Digits

Example: (555)-555-5555, 555.555.5555, 1234567890, etc.

```ruby
class Person < ActiveRecord::Base
  validates :mobile, :phone_number => {:ten_digits => true}
end
```

### Message

Set the message that's added to the errors collection by using the
`message` option:

```ruby
class Person < ActiveRecord::Base
  validates :mobile, :phone_number => {:message => "invalid and can only be attributable to human error"}
end
```

### Format/Match by Regular Expression

You can specify that a number matches a regular expression by using the
`format` option:

```ruby
class Person < ActiveRecord::Base
  validates :mobile, :phone_number => {:format => /\d{3}-\d{3}-\d{4}/}
end
```

### Allow Nil

```ruby
class Person < ActiveRecord::Base
  validates :mobile, :phone_number => {:allow_nil => true}
end
```

### Allow Blank

```ruby
class Person < ActiveRecord::Base
  validates :mobile, :phone_number => {:allow_blank => true}
end
```

### Multiple

```ruby
class Person < ActiveRecord::Base
  validates :mobile, :phone_number => {:ten_digits => true, :seven_digits => true, :allow_blank => true, :message => "Phone number must be either seven or digits in length, or blank."}
end
```

## Self-Promotion

Like validates\_phone\_number? Follow the project on
[GitHub](https://github.com/travisjeffery/validates_phone_number). 

You should follow [travisjeffery](http://travisjeffery.com) on
[GitHub](https://github.com/travisjeffery) and
[Twitter](http://twitter.com/travisjeffery) too. Thanks!
