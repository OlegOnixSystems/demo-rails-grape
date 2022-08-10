# frozen_string_literal: true

module GrapeTypes
  class Email
    attr_reader :value

    def initialize(email)
      @value = email
    end

    def self.parse(value)
      return new(value) if value.match?(/\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/)

      Grape::Types::InvalidValue.new('has invalid address')
    end
  end
end
