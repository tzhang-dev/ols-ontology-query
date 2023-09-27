# Ontology Lookup with OLS

This is a simple Ruby wrapper for the [Ontology Lookup Service](http://www.ebi.ac.uk/ols/index). 

It allows you to query the OLS for ontology id and retrieve meta information about the ontology.

# Set up

This project requires Ruby 3.14 or higher.

```shell
$ git clone https://github.com/yah-yuan/ols-ontology-query.git
$ bundle install
```

This script will install required gems.

# Usage

To query the OLS for an ontology id, run the following command:

```shell
$ ruby main.rb <ontology id>
```

If the ontology id is valid, the script will return the following information in JSON format:

- The full ontology title 
- The ontology description 
- The number of terms 
- The current status
## Example

```shell
$ ruby main.rb agro
{
  "title": "Agronomy Ontology",
  "description": "AgrO is an ontlogy for representing agronomic practices, techniques, variables and related entities",
  "numberOfTerms": 3736,
  "status": "LOADED"
}
```

# Docker Usage

To build docker image, you need to have [Docker](https://www.docker.com/) installed.

The following assumes you have already cloned this repository and grant right privileges to the docker daemon.

To build the docker image, run the following command:

```shell
$ docker build -t ols .
```

To run the docker image to query ontology, run the following command:

```shell
$ docker run --rm ols <ontology id>
```