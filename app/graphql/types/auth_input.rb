# frozen_string_literal: true

module Types
  class AuthInput < BaseInputObject
    graphql_name 'AuthInput'

    argument :email, String, required: true
    argument :password, String, required: true
  end
end