# frozen_string_literal: true

require 'uri'
require 'http'
require 'resolv-replace'
require './src/ols_response'

# A group of OLS API caller.
module OLSCaller
  @ols_host = "https://www.ebi.ac.uk/"

  # Fetch the ontology metadata from OLS with given ontology id.
  # @param [String] ontology_id The ontology id.
  # @param [Integer] timeout The timeout in seconds.
  # @return [Hash] The ontology metadata.
  def get_ontology(ontology_id, timeout = 10)
    ontology_uri = URI.parse("#{@ols_host}ols/api/ontologies/#{ontology_id}")
    begin
      response = HTTP.timeout(read: timeout).follow.get(ontology_uri)
    rescue => e
      STDERR.puts "Error: #{e}"
      exit
    end
    ols_response = OLSResponse.new(response)
    body = ols_response.body
    ret = {}
    if body.key?("config")
      ret["title"] = body["config"]["title"]
      ret["description"] = body["config"]["description"]
    end
    ret["numberOfTerms"] = body["numberOfTerms"]
    ret["status"] = body["status"]
    ret
  end
end
