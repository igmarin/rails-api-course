# frozen_string_literal: true

# UserAuthenticator class
class UserAuthenticator
  class AuthenticationError < StandardError; end

  attr_reader :user

  def initialize(code)
  end

  def perform
    raise AuthenticationError
  end
end
