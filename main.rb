# frozen_string_literal: true

require './src/ols_caller'
require './src/cli_parser'
require 'json'

include OLSCaller

def main
  parser = CliParser.new
  ontology_id =  parser.ontology_id
  # caller = OLSCaller.new
  data = OLSCaller.get_ontology(ontology_id)
  puts JSON.pretty_generate(data) # pretty print the data in JSON format
end

main