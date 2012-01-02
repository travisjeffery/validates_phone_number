require 'active_model/validator'

module ValidatesPhoneNumber
  class Validator < ActiveModel::EachValidator
    def initialize options
      @type = options.delete(:type) || :string
      @allow_nil = options.delete(:allow_nil)
      @format = options.delete(:format)
      super
    end

    def validate_each record, attr_name, value
      return if @allow_nil && value.nil?
      return if Phoner::Phone.valid? value
      return if value =~ @format
      record.errors.add attr_name, "'#{value}' is not a valid"
    end
  end
end

ActiveModel::Validations::PhoneNumberValidator = ValidatesPhoneNumber::Validator
