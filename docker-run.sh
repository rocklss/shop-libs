#!/bin/bash

# Run the Shopify CLI Docker container with volume mapping and port forwarding
docker run -it --rm -v "$(pwd):/app" -p 9292:9292 shopify-cli-env
