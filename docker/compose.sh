#!/bin/bash
COMMAND="${1:-"up -d"}"
NPM_RUN="${2:-start}"
PORT="${3:-8080}"
ENVIRONMENT="${4:-production}"

NODE_ENV="$ENVIRONMENT" NPM_RUN="$NPM_RUN" PORT="$PORT" docker-compose ${COMMAND}
