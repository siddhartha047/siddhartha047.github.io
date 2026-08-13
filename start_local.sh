#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$ROOT_DIR"

HOST="${HOST:-127.0.0.1}"
PORT="${PORT:-4000}"
LIVERELOAD_PORT="${LIVERELOAD_PORT:-35729}"
PID_FILE="$ROOT_DIR/.jekyll-local.pid"
LOG_FILE="$ROOT_DIR/.jekyll-local.log"

if [[ -s "$PID_FILE" ]]; then
  existing_pid="$(cat "$PID_FILE")"
  if [[ "$existing_pid" =~ ^[0-9]+$ ]] && kill -0 "$existing_pid" 2>/dev/null; then
    echo "Local Jekyll server is already running with PID $existing_pid."
    echo "Open http://$HOST:$PORT/"
    exit 0
  fi
  rm -f "$PID_FILE"
fi

if command -v lsof >/dev/null 2>&1 && lsof -nP -iTCP:"$PORT" -sTCP:LISTEN >/dev/null 2>&1; then
  echo "Port $PORT is already in use."
  echo "Stop the existing process or choose another port, for example:"
  echo "PORT=4001 ./start_local.sh"
  exit 1
fi

if [[ -d "$HOME/.rbenv/bin" ]]; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  if command -v rbenv >/dev/null 2>&1; then
    eval "$(rbenv init - bash)"
  fi
fi

if ! command -v bundle >/dev/null 2>&1; then
  echo "Bundler is not available. Open a new terminal or make sure rbenv is initialized."
  exit 1
fi

: > "$LOG_FILE"
bundle exec jekyll serve \
  --host "$HOST" \
  --port "$PORT" \
  --livereload \
  --livereload-port "$LIVERELOAD_PORT" \
  > "$LOG_FILE" 2>&1 &

server_pid="$!"
echo "$server_pid" > "$PID_FILE"

for _ in {1..20}; do
  if ! kill -0 "$server_pid" 2>/dev/null; then
    rm -f "$PID_FILE"
    echo "Jekyll failed to start. Last log lines:"
    tail -n 40 "$LOG_FILE"
    exit 1
  fi

  if command -v lsof >/dev/null 2>&1 && lsof -nP -iTCP:"$PORT" -sTCP:LISTEN >/dev/null 2>&1; then
    echo "Started local Jekyll server with PID $server_pid."
    echo "Open http://$HOST:$PORT/"
    echo "Logs: $LOG_FILE"
    exit 0
  fi

  sleep 0.5
done

echo "Jekyll is starting with PID $server_pid."
echo "Open http://$HOST:$PORT/ in a few seconds."
echo "Logs: $LOG_FILE"
