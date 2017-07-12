#!/bin/sh

if [ -z "$PORT" ]; then
    echo "Warning: missing PORT environment variable. Assuming PORT=2015"
    PORT=2015
fi

/usr/bin/caddy -port $PORT -agree $@
