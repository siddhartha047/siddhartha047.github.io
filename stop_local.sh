#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$ROOT_DIR"

PORT="${PORT:-4000}"
PID_FILE="$ROOT_DIR/.jekyll-local.pid"

stop_pid() {
  local pid="$1"

  if ! kill -0 "$pid" 2>/dev/null; then
    return 0
  fi

  kill "$pid" 2>/dev/null || true
  for _ in {1..20}; do
    if ! kill -0 "$pid" 2>/dev/null; then
      return 0
    fi
    sleep 0.5
  done

  kill -9 "$pid" 2>/dev/null || true
}

if [[ -s "$PID_FILE" ]]; then
  pid="$(cat "$PID_FILE")"
  if [[ "$pid" =~ ^[0-9]+$ ]]; then
    stop_pid "$pid"
    rm -f "$PID_FILE"
    echo "Stopped local Jekyll server with PID $pid."
    exit 0
  fi
  rm -f "$PID_FILE"
fi

if command -v lsof >/dev/null 2>&1; then
  fallback_pids="$(lsof -tiTCP:"$PORT" -sTCP:LISTEN 2>/dev/null || true)"
  if [[ -n "$fallback_pids" ]]; then
    stopped_any=false
    for pid in $fallback_pids; do
      command_line="$(ps -p "$pid" -o command= 2>/dev/null || true)"
      if [[ "$command_line" == *"jekyll serve"* || "$command_line" == *"ruby"* ]]; then
        stop_pid "$pid"
        stopped_any=true
        echo "Stopped process $pid listening on port $PORT."
      fi
    done

    if [[ "$stopped_any" == true ]]; then
      exit 0
    fi

    echo "Port $PORT is in use, but no Jekyll/Ruby server was identified."
    echo "Inspect it with: lsof -nP -iTCP:$PORT -sTCP:LISTEN"
    exit 1
  fi
fi

echo "No local Jekyll server is running on port $PORT."
