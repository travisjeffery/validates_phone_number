# Validates Phone Number

Validate phone numbers in your Rails project.

For example, given a User model with a phone number attribute of `phone number`
that's a string, see if a given record has a valid phone number like so:

```
  class Person < ActiveRecord::Base
    validates :phone_number, :phone_number => true
  end
```

You can also specify the usual options like `allow_nil`, and `format`.
