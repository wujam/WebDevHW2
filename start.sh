#!/bin/bash

cd /home/jwu/hw02b/elixir/elixir-practice


export MIX_ENV=prod
export PORT=4790

echo "Stopping old copy of app, if any..."

_build/prod/rel/practice/bin/practice stop || true

echo "Starting app..."

_build/prod/rel/practice/bin/practice foreground


