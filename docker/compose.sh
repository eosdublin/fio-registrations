#!/bin/bash
COMMAND="${1:-"up -d"}"
NPM_RUN="${2:-start}"
ENVIRONMENT="${3:-production}"

NODE_ENV="$ENVIRONMENT" NPM_RUN="$NPM_RUN" docker-compose ${COMMAND}
