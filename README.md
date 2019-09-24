# Optune Servo with Stub (adjust) and NewRelic (measure) drivers

## Build servo container
```
make container
```

This will build an image named `opsani/servo-stub-newrelic`. If you want to build the container under a different name and/or push to private registry:
```
IMG_NAME=my-registry.com/opsani/servo-stub-newrelic make container

```

## Run Servo (as a docker container)
```
docker run -d --name opsani-servo \
    -v /path/to/optune_newrelic_account_id:/run/secrets/optune_newrelic_account_id \
    -v /path/to/optune_newrelic_apm_api_key:/run/secrets/optune_newrelic_apm_api_key \
    -v /path/to/optune_newrelic_apm_app_id:/run/secrets/optune_newrelic_apm_app_id \
    -v /path/to/optune_newrelic_insights_query_key:/run/secrets/optune_newrelic_insights_query_key \
    -v /path/to/optune_auth_token:/opt/optune/auth_token \
    -v /path/to/config.yaml:/servo/config.yaml \
    opsani/servo-stub-newrelic --auth-token /opt/optune/auth_token --account my_account my_app
```

Where:
 * `/path/to/optune_newrelic_account_id` - file containing NewRelic account id
 * `/path/to/optune_newrelic_apm_api_key` - file containing NewRelic APM API access key
 * `/path/to/optune_newrelic_apm_app_id` - file containing NewRelic APM APP id
 * `/path/to/optune_newrelic_insights_query_key` - file containing NewRelic Insights Query access key
 * `/path/to/optune_auth_token` - file containing the authentication token for the Optune backend service
 * `/path/to/config.yaml` - config file containing the configuration for the [stub](https://github.com/opsani/servo-stub) and [newrelic](https://github.com/opsani/servo-newrelic) drivers (see links for details on how to configure each).
 * `my_account` - your Optune account name
 * `my_app` - the application name

There may be additional files required or supported by the drivers that may need to be mounted in the container, refer to the driver documentation for details.
