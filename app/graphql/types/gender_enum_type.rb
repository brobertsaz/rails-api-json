# frozen_string_literal: true

module Types
  class GenderEnumType < Types::BaseEnum
    description 'Gender for members'

    value 'male', 'Male'
    value 'female', 'Female'
  end
end
