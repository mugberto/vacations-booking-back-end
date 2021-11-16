require 'swagger_helper'

RSpec.describe 'Register new user'  do

  path '/api/v1/users' do
    
    post 'Creates a new user' do 
      tags 'Register a new user'
      consumes 'application/json', 'application/xml'
      produces 'application/json'
      parameter name: :user, in: :body, schema: {
        type: :object, 
        properties: {
          username: { type: :string },
          email: { type: :string },
          password: { type: :string },
          password_confirmation: { type: :string }
        },
        required: [ 'username', 'email', 'password', 'password_confirmation' ]
      }

      response '201', 'User registered' do
        schema type: :object,
          properties: {
            token: {type: :string }
          },
          required: [ 'token' ]

        let(:user) { { username: "User", email: "user@mail.com", password: "password", password_confirmation: "password" } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:user) { { username: "User" } }
        run_test!
      end
    end
  end
end

RSpec.describe 'Login a user'  do

  path '/api/v1/users/sign_in' do
    
    post 'Authenticates the user' do 
      tags 'Login a user'
      consumes 'application/json', 'application/xml'
      produces 'application/json'
      parameter name: :user, in: :body, schema: {
        type: :object, 
        properties: {
          email: { type: :string },
          password: { type: :string }
        },
        required: [ 'email', 'password' ]
      }

      response '201', 'User signed in' do
        schema type: :object,
          properties: {
            token: {type: :string }
          },
          required: [ 'token' ]

        let(:user) { { email: "user@mail.com", password: "password" } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:user) { { email: "user@mail.com" } }
        run_test!
      end
    end
  end
end



#   # path '/users/sign_in' do
    
#   #   post 'Authenticate a user' do
#   #     tags 'Authenticate'
#   #     consumes 'applicaton/json'
#   #     parameter name: :user, in: :body, schema: {
#   #       type: :object, 
#   #       properties: {
#   #         email: { type: :string },
#   #         password: { type: :string }
#   #       },
#   #       required: [ 'email', 'password']
#   #     }
#   #     produces 'application/json'

#   #     response '201', 'User authenticated' do
#   #       schema type: :object,
#   #         properties: {
#   #           token: {type: :string }
#   #         },
#   #         required: [ 'token' ]

#   #       let(:user) {{email: "user@mail.com", password: "password"}}
#   #       run_test!
#   #     end

#   #     response '422', 'invalid request' do
#   #       let(:user) { {email: "user@mail.com"} }
#   #       run_test!
#   #     end
#   #   end
#   # end
# end
