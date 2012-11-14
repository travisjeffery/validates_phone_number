require 'test_helper'

class TestValidator < MiniTest::Unit::TestCase
  def setup
    Person.reset_callbacks(:validate)
    Person._validators.clear
    @person = Person.new
  end

  def test_model_validates_with_phone_number_option
    Person.validates :phone_number, :phone_number => true
  end
  
  def test_validates_defaults
    Person.validates :phone_number, :phone_number => true

    @person.phone_number = "555-565-5703"
    assert @person.valid?, @person.errors.full_messages

    @person.phone_number = "565-5703"
    assert @person.valid?, @person.errors.full_messages
  end

  def test_invalidates
    Person.validates :phone_number, :phone_number => true
    @person.phone_number = "423432432452"
    assert !@person.valid?

    @person.phone_number = "555^555^555^5555"
    assert !@person.valid?
  end

  def test_validates_with_format
    Person.validates :phone_number, :phone_number => {:format => /(\d+\^){3}\d+/}
    @person.phone_number = "555^555^555^5555"
    assert @person.valid?
  end

  def test_explicit_message
    Person.validates :phone_number, :phone_number => {:message => "invalid and can only be attributable to human error"}
    @person.phone_number = nil
    @person.valid?
    assert_equal 1, @person.errors.size
    assert_match /invalid and can only be attributable to human error/, @person.errors.full_messages.first
  end

  def test_validates_international_number
    Person.validates :phone_number, :phone_number => {:format => /(\d+\^){3}\d+/}
    @person.phone_number = "555^555^555^5555"
    assert @person.valid?
  end

  def test_validates_ten_digit_number
    Person.validates :phone_number, :phone_number => {:ten_digits => true}
    @person.phone_number = "(555)-555-5555"
    assert @person.valid?

    @person.phone_number = "(55)-555-5555"
    assert !@person.valid?

    @person.phone_number = "-(555)-555-5555"
    assert !@person.valid?

    @person.phone_number = "555-555-5555"
    assert @person.valid?

    @person.phone_number = "555.555.5555"
    assert @person.valid?

    @person.phone_number = "5555555555"
    assert @person.valid?
  end

  def test_validates_multiple_options
    Person.validates :phone_number, :phone_number => {:ten_digits => true, :seven_digits => true, :allow_blank => true}

    @person.phone_number = "555-5555"
    assert @person.valid?

    @person.phone_number = "555.555.5555"
    assert @person.valid?

    @person.phone_number = ""
    assert @person.valid?

    @person.phone_number = "1-123-456-7890"
    assert !@person.valid?
  end

  def test_validates_seven_digit_number
    Person.validates :phone_number, :phone_number => {:seven_digits => true}
    @person.phone_number = "555-5555"
    assert @person.valid?

    @person.phone_number = "-55-5555"
    assert !@person.valid?

    @person.phone_number = "5555555"
    assert @person.valid?

    @person.phone_number = "555.5555"
    assert @person.valid?
  end

  def test_validates_leading_1
    Person.validates :phone_number, :phone_number => {:leading_1 => true}
    @person.phone_number = "+1 (123) 456-7890"
    assert @person.valid?

    @person.phone_number = "1-123-456-7890"
    assert @person.valid?

    @person.phone_number = "2-123-456-7890"
    assert !@person.valid?
  end

  def test_allow_nil_option_defaults_to_false
    Person.validates :phone_number, :phone_number => true
    @person.phone_number = nil
    assert !@person.valid?
  end

  def test_allow_nil_validates_nil_phone_number
    Person.validates :phone_number, :phone_number => {:allow_nil => true}
    @person.phone_number = nil
    assert @person.valid?
  end

  def def test_allow_blank_validates_blank_phone_number
    Person.validates :phone_number, :phone_number => {:allow_blank => true}

    @person.phone_number = nil
    assert @person.valid?

    @person.phone_number = ""
    assert @person.valid?
  end
end

