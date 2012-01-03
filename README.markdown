[![Build Status](https://secure.travis-ci.org/travisjeffery/validates_phone_number.png)](http://travis-ci.org/travisjeffery/validates_phone_number)

# Validates Phone Number

`validates_phone_number` adds validation methods to ActiveModel for validating
phone numbers.

For example, given a User model with a phone number attribute of `phone number`
that's a string, see if a given record has a valid phone number like so:

```
  class Person < ActiveRecord::Base
    validates :phone_number, :phone_number => true
  end
```

You can also specify the usual options like `allow_nil`, and `format`.
