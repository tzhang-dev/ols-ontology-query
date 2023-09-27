# frozen_string_literal: true

require 'json'

# OLS response wrapper.
class OLSResponse
  @response

  # @param [HTTP::Response] response The http response from OLS API service.
  def initialize(response)
    case response.code
    when 400
      STDERR.puts "The request was malformed."
      STDERR.puts "Error: #{response.body.error}."
      exit
    when 404
      STDERR.puts "Error: The requested ontology does not exist."
      exit
    when 200
      @response = response
    else
      STDERR.puts "Error: Request failed with status code #{response.code}."
      exit
    end
  end

  # Get the response body in Hash format.
  # @return [Hash] The response body.
  def body
    JSON.parse(@response.body.to_s)
  end
end
