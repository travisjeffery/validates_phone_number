module ValidatesPhoneNumber
  module Message
    DEFAULT_ERROR_MESSAGE = "%s is not valid"

    private

    def error_message_for value
      @message || 
        DEFAULT_ERROR_MESSAGE % value
    end
  end
end
