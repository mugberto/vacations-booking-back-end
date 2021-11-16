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

RSpec.describe 'Destinations'  do

  path '/api/v1/destinations' do
    
    post 'Creates a new destination' do 
      tags 'Add destination'
      security [bearerAuth: [] ]
      consumes 'application/json', 'application/xml'
      produces 'application/json'
      parameter name: :user, in: :body, schema: {
        type: :object, 
        properties: {
          name: { type: :string },
          location: { type: :string },
          image_url: { type: :string },
          price_per_day: { type: :number }
        },
        required: [ 'name', 'location', 'image_url', 'price_per_day' ]
      }

      response '201', 'Desination created' do
        schema type: :object,
          properties: {
            status: { type: :string },
            message: { type: :string }
          },
          required: [ 'status', 'message' ]

        let(:destination) { { name: 'Gracier National Park', location: 'USA', image_url: 'https://res.cloudinary.com/dqdrsilxz/image/upload/v1636573679/sample.jpg',price_per_day: 100 } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:destination) { { name: 'Gracier National Park' } }
        run_test!
      end
    end

    get 'Retrieves a destinations' do
      tags 'Get destinations'
      produces 'application/json'

      response '200', 'Get destinations' do
        schema type: :array,
          properties: {
            name: { type: :string },
            location: { type: :string },
            image_url: { type: :string },
            price_per_day: { type: :number }
          },
          required: [ 'name', 'location', 'image_url', 'price_per_day' ]

        run_test!
      end

      response '406', 'unsupported accept header' do
        let(:'Accept') { 'application/foo' }
        run_test!
      end
    end
  end

  path '/api/v1/destinations/{id}' do
    
    delete 'Removes a destination' do 
      tags 'Remove a destination'
      security [bearerAuth: [] ]
      produces 'application/json'
      parameter name: :id, in: :path, type: :string

      response '201', 'Desination deleted' do
        schema type: :object,
          properties: {
            status: { type: :string },
            message: { type: :string }
          },
          required: [ 'status', 'message' ]

        let(:id) { Destination.create( name: 'Gracier National Park', location: 'USA', image_url: 'https://res.cloudinary.com/dqdrsilxz/image/upload/v1636573679/sample.jpg',price_per_day: 100).id }
        run_test!
      end

      response '404', 'Destination not found' do
        let(:id) { 'invalid' }
        run_test!
      end
      
      response '406', 'unsupported accept header' do
        let(:'Accept') { 'application/foo' }
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
