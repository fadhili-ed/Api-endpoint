# frozen_string_literal: true

require 'rails_helper'
require 'swagger_helper'

describe 'User' do

  path '/api/v0/auth' do

    post 'user registration/Sign up' do
      tags 'Users'
      consumes 'application/json'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          email: { type: :string },
          password: { type: :string },
          password_confirmation: { type: :string },
        },
        required: [ 'email', 'password', 'password_confirmation' ]
      }

      response '200', 'success' do
        let(:user) { { email: 'user@example.com', password: 'User@123.', password_confirmation: 'User@123.'  } }
        run_test!
      end
    end
  end
end

RSpec.describe 'Users Registration', type: :request do
  let(:header) { { HTTP_ACCEPT: 'application/json' } }
  context 'with valid credentials' do
    it 'returns user token' do
      post '/api/v1/auth',
           params: {
             email: 'email@example.com',
             password: 'password',
             password_confirmation: 'password'
           },
           headers: headers
      expect(response_json['status']).to eq 'success'
      expect(response.status).to eq 200
    end
  end
  context 'returns an error message when user submits' do
    it 'non-matching password confirmation' do
      post '/api/v1/auth',
           params: {
             email: 'jane@doe.com',
             password: '12333',
             password_confirmation: 'password'
           },
           headers: headers

      expect(response_json['errors']['password_confirmation']).to eq [
           "doesn't match Password"
         ]
      expect(response.status).to eq 422
    end

    it 'an invalid email address' do
      post '/api/v1/auth',
           params: {
             email: 'Gijoe',
             password: 'password',
             password_confirmation: 'password'
           },
           headers: headers

      expect(response_json['errors']['email']).to eq ['is not an email']
      expect(response.status).to eq 422
    end

    it 'an already registered email' do
      FactoryBot.create(
        :user,
        email: 'jane@doe.com',
        password: 'password',
        password_confirmation: 'password'
      )

      post '/api/v1/auth',
           params: {
             email: 'jane@doe.com',
             password: 'strongpass',
             password_confirmation: 'strongpass'
           },
           headers: headers

      expect(response_json['errors']['email']).to eq ['has already been taken']
      expect(response.status).to eq 422
    end
  end
end
