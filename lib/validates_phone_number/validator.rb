require 'active_model/validator'

module ValidatesPhoneNumber
  class Validator < ActiveModel::EachValidator
    include ValidatesPhoneNumber::Message
    include ValidatesPhoneNumber::Formats

    def initialize options
      @default = options.keys.size == 1
      @type = options.delete(:type) || :string
      @allow_nil = options.delete(:allow_nil)
      @format = options.delete(:format)
      @message = options.delete(:message)
      @ten_digits = options.delete(:ten_digits)
      @seven_digits = options.delete(:seven_digits)
      @leading_1 = options.delete(:leading_1)
      super
    end

    def validate_each record, attr_name, value
      return if @allow_nil && value.nil?
      return if value =~ @format
      return if value =~ TEN_DIGITS if @ten_digits
      return if value =~ SEVEN_DIGITS if @seven_digits
      return if value =~ LEADING_1 if @leading_1
      return if value =~ TEN_DIGITS || value =~ SEVEN_DIGITS if @default
      message = error_message_for value
      record.errors.add attr_name, message
    end
  end
end

ActiveModel::Validations::PhoneNumberValidator = ValidatesPhoneNumber::Validator
