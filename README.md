## DogWalking Case

[![CircleCI](https://circleci.com/gh/ylaguna/dog_walking/tree/master.svg?style=svg&circle-token=d64bbaa824da0c8d5a81dbef102d51e59e14d0af)](https://circleci.com/gh/ylaguna/dog_walking/tree/master)

[Swagger API](https://app.swaggerhub.com/apis/ylaguna/dogHero)


### Dependencies

* Ruby 2.6.3
* Postgres 11.2 ( available in docker compose )

### Running the Project

If you are running for the first time:

`bin/setup`

Then:

`rails s -p 4000` ( port used by the client )

### For testing

`rspec .`
