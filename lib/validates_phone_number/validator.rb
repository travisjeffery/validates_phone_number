require 'active_model/validator'

module ValidatesPhoneNumber
  class Validator < ActiveModel::EachValidator
    include ValidatesPhoneNumber::Message

    def initialize options
      @type = options.delete(:type) || :string
      @allow_nil = options.delete(:allow_nil)
      @format = options.delete(:format)
      @message = options.delete(:message)
      super
    end

    def validate_each record, attr_name, value
      return if @allow_nil && value.nil?
      return if Phoner::Phone.valid? value
      return if value =~ @format
      message = error_message_for value
      record.errors.add attr_name, message
    end
  end
end

ActiveModel::Validations::PhoneNumberValidator = ValidatesPhoneNumber::Validator
