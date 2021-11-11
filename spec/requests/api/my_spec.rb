require 'swagger_helper'

RSpec.describe 'Apps API', type: :request do
  path '/reg' do
    post 'Creates a new user' do 
      tags 'Register'
      consumes 'applicaton/json'
      parameter name: :user, in: :body, schema: {
        type: :object, 
        properties: {
          name: { type: :string },
          email: { type: :string },
          password: { type: :string },
          password_confirmation: { type: :string }
        },
        required: [ 'name', 'email', 'password', 'password_confirmation']
      }
      produces 'application/json'

      response '201', 'User registered' do
        schema type: :object,
          properties: {
            token: {type: :string }
          },
          required: [ 'token' ]

        let(:user) {{name: "User", email: "user@mail.com", password: "password", password_confirmation: "password"}}
        run_test!
      end

      response '422', 'invalid request' do
        let(:user) { {name: "User"} }
        run_test!
      end
    end
  end

  path '/auth' do
    
    post 'Authenticate a user' do
      tags 'Authenticate'
      consumes 'applicaton/json'
      parameter name: :user, in: :body, schema: {
        type: :object, 
        properties: {
          email: { type: :string },
          password: { type: :string }
        },
        required: [ 'email', 'password']
      }
      produces 'application/json'

      response '201', 'User authenticated' do
        schema type: :object,
          properties: {
            token: {type: :string }
          },
          required: [ 'token' ]

        let(:user) {{email: "user@mail.com", password: "password"}}
        run_test!
      end

      response '422', 'invalid request' do
        let(:user) { {email: "user@mail.com"} }
        run_test!
      end
    end
  end
end
