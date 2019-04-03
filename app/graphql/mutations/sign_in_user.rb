module Mutations
  class SignInUser < GraphQL::Schema::Mutation
    null true

    argument :email, Types::AuthProviderEmailInput, required: false

    field :token, String, null: true
    field :user, Types::UserType, null: true

    def resolve(email: nil)
      # basic validation
      return unless email

      user = User.find_by email: email[:email]

      # ensures we have the correct user
      return unless user
      return unless user.authenticate(email[:password])

      # auth_token = Knock::AuthToken.new payload: { sub: user.id }
      #
      # { user: user, token: auth_token.token }
    end
  end
end
