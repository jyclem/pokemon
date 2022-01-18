# README

## Prerequisites

Redis needs to be install (otherwise change the cache system to Memory in all environments)

## Prepare the environment

- bundle install
- rails db:prepare

## Start the server

- on Development environment: rails s
- on Production environment: rails s -e production

## To add a new Pokemon

- use the json client of your choice
- make a post request on http://localhost:3000/pokemons with the following params:
{
	"pokemon": {
		"name": <name of the pokemon>
	}
}
- example with CURL: 
curl -X POST http://localhost:3000/pokemons -H 'Content-Type: application/json' -d '{"name":"ditto"}'

## Requests

### Create a new Pokemon

POST http://localhost:3000/pokemons
params: {
  "pokemon": {
		"name": <name of the pokemon>
	}
}

### Get all pokemons

GET http://localhost:3000/pokemons

### Get a specific pokemon

GET http://localhost:3000/pokemons/<id of the pokemon>

## Get swagger definition (NOT WORKING YET)

- run: rake rswag:specs:swaggerize
- check the result: http://localhost:3000/api-docs or in the file swagger/v1/swagger.yaml