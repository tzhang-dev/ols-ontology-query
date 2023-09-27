# frozen_string_literal: true

# Command line arguments parser.
class CliParser
  @ontology_id
  @usage_prompt = 'Usage: ruby main.rb <ontology id>'
  def initialize
    get_env
    if ARGV.empty?
      STDERR.puts 'Error: No ontology id provided.'
      STDERR.puts @usage_prompt
      exit
    end
    if ARGV.length > 1
      STDERR.puts 'Error: Too many arguments provided.'
      STDERR.puts @usage_prompt
      exit
    end
    @ontology_id = ARGV[0]
  end

  # Test if the program is running in docker.
  private def get_env
    if ENV.key?("OLS_DOCKER_ENV")
      @usage_prompt = 'Usage: docker run --rm ols <ontology id>'
    end
  end

  # Get the ontology id from command line arguments.
  def ontology_id
    @ontology_id
  end
end
