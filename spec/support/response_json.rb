# frozen_string_literal: true

module ResponseJSON
  def response_json
    JSON.parse(response.body)
  end
end

RSpec.configure { |config| config.include ResponseJSON }
