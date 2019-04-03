module Mutations
  class SignInUser < GraphQL::Schema::Mutation
    null true

    argument :email, Types::AuthInput, required: false

    type Types::AuthType

    def resolve(email: nil)
      # basic validation
      return unless email

      user = User.find_by email: email[:email]

      # ensures we have the correct user
      return unless user
      return unless user.authenticate(email[:password])

      token = OpenStruct.new(jwt: AuthToken.token(user), user: user)
      context[:session][:token] = token
    end
  end
end
