# frozen_string_literal: true

class AppBaseError < StandardError
  class << self
    def http_code(code = 500)
      instance_variable_set(:@http_code, code)
    end

    def default_message(text = 'Unexpected server error')
      instance_variable_set(:@default_message, text)
    end
  end

  def initialize(msg = nil)
    super(msg || self.class.instance_variable_get(:@default_message))
  end

  def default_message
    self.class.instance_variable_get(:@default_message)
  end

  def http_code
    self.class.instance_variable_get(:@http_code)
  end
end
