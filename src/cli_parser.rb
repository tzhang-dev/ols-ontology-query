# frozen_string_literal: true

# Command line arguments parser.
class CliParser
  @ontology_id
  def initialize
    if ARGV.empty?
      STDERR.puts 'No ontology id provided.'
      STDERR.puts 'Usage: ruby main.rb <ontology id>'
      exit
    end
    if ARGV.length > 1
      STDERR.puts 'Too many arguments provided.'
      STDERR.puts 'Usage: ruby main.rb <ontology id>'
      exit
    end
    @ontology_id = ARGV[0]
  end

  # Get the ontology id from command line arguments.
  def ontology_id
    @ontology_id
  end
end
