#!/bin/bash

# Default values
PORT=3000
ENV_FILE=""

# Parse command-line arguments
while [[ "$#" -gt 0 ]]; do
  case "$1" in
    --port)
      PORT="$2"
      shift 2
      ;;
    --env)
      ENV_FILE="$2"
      shift 2
      ;;
    *)
      echo "Unknown option: $1"
      exit 1
      ;;
  esac
done

# Validate required arguments
if [[ -z "$ENV_FILE" ]]; then
  echo "Error: --env flag is required."
  exit 1
fi

# Run Docker command
docker run -p "$PORT:$PORT" --env-file "$ENV_FILE" ghcr.io/blockscout/frontend:latest
