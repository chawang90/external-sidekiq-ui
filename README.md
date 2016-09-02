# External Sidekiq Web UI

Run the Sidekiq Web UI (a Sinatra app) outside your main app.

## Setting up the environment

You will need to add environment variables to `.env` in development. `AUTH_USER` and `AUTH_PASSWORD` are required for basic auth. Store the URL for your Redis instance in an environment variable of your choice, and specify the name of the environment variable as the value of `REDIS_PROVIDER`:

```
REDIS_PROVIDER="REDISTOGO_URL"
```

## Development

```bash
bundle install
bundle exec rackup
```
