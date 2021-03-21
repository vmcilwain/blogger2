#!/usr/bin/env bash
set -e

# remove pid files
rm -f /myapp/tmp/pids/server.pid

# execute main process (CMD) in docker file
exec "$@"