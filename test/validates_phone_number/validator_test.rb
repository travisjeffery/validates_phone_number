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

  def test_invalid_record_if_invalid_phone_number
    Person.validates :phone_number, :phone_number => true
    @person.phone_number = "423432432452"
    assert !@person.valid?
  end
  
  def test_valid_record_if_valid_phone_number
    Person.validates :phone_number, :phone_number => true
    @person.phone_number = "555-565-5703"
    assert @person.valid?
  end

  def test_allow_nil_option_defaults_to_false
    Person.validates :phone_number, :phone_number => true
    @person.phone_number = nil
    assert !@person.valid?
  end

  def test_nil_is_record_record_if_allow_nil
    Person.validates :phone_number, :phone_number => {:allow_nil => true}
    @person.phone_number = nil
    assert @person.valid?
  end

  def test_invalid_record_by_format_option
    Person.validates :phone_number, :phone_number => true
    @person.phone_number = "555^555^555^5555"
    assert !@person.valid?
  end

  def test_valid_record_by_format_option
    Person.validates :phone_number, :phone_number => {:format => /(\d+\^){3}\d+/}
    @person.phone_number = "555^555^555^5555"
    assert @person.valid?
  end

  def test_specify_message
    Person.validates :phone_number, :phone_number => {:message => "invalid and can only be attributable to human error"}
    @person.phone_number = nil
    @person.valid?
    assert_equal 1, @person.errors.size
    assert_match /invalid and can only be attributable to human error/, @person.errors.full_messages.first
  end
end

