#!/bin/sh
set -e
if [ -e laravel-echo-server.lock ]; then
  rm -f laravel-echo-server.lock
fi
if ! [ -e laravel-echo-server.json ]; then
  cp laravel-echo-server.example.json laravel-echo-server.json
fi

sed -i -e "s%{{ LARAVEL_ECHO_SERVER_CLIENTS }}%$LARAVEL_ECHO_SERVER_CLIENTS%g" laravel-echo-server.json
sed -i -e "s%{{ LARAVEL_ECHO_SERVER_DATABASE }}%$LARAVEL_ECHO_SERVER_DATABASE%g" laravel-echo-server.json
sed -i -e "s%{{ LARAVEL_ECHO_SERVER_REDIS_HOSTNAME }}%$LARAVEL_ECHO_SERVER_REDIS_HOSTNAME%g" laravel-echo-server.json
sed -i -e "s%{{ LARAVEL_ECHO_SERVER_REDIS_PORT }}%$LARAVEL_ECHO_SERVER_REDIS_PORT%g" laravel-echo-server.json
sed -i -e "s%{{ LARAVEL_ECHO_SERVER_REDIS_PASSWORD }}%$LARAVEL_ECHO_SERVER_REDIS_PASSWORD%g" laravel-echo-server.json
sed -i -e "s%{{ LARAVEL_ECHO_SERVER_REDIS_KEYPREFIX }}%$LARAVEL_ECHO_SERVER_REDIS_KEYPREFIX%g" laravel-echo-server.json
sed -i -e "s%{{ LARAVEL_ECHO_SERVER_REDIS_OPTIONS_DB }}%$LARAVEL_ECHO_SERVER_REDIS_OPTIONS_DB%g" laravel-echo-server.json
sed -i -e "s%{{ LARAVEL_ECHO_SERVER_SQLITE_DATABASEPATH }}%$LARAVEL_ECHO_SERVER_SQLITE_DATABASEPATH%g" laravel-echo-server.json
sed -i -e "s%{{ LARAVEL_ECHO_SERVER_DEVMODE }}%$LARAVEL_ECHO_SERVER_DEVMODE%g" laravel-echo-server.json
sed -i -e "s%{{ LARAVEL_ECHO_SERVER_HOST }}%$LARAVEL_ECHO_SERVER_HOST%g" laravel-echo-server.json
sed -i -e "s%{{ LARAVEL_ECHO_SERVER_PORT }}%$LARAVEL_ECHO_SERVER_PORT%g" laravel-echo-server.json
sed -i -e "s%{{ LARAVEL_ECHO_SERVER_PROTOCOL }}%$LARAVEL_ECHO_SERVER_PROTOCOL%g" laravel-echo-server.json
sed -i -e "s%{{ LARAVEL_ECHO_SERVER_SSL_CERT_PATH }}%$LARAVEL_ECHO_SERVER_SSL_CERT_PATH%g" laravel-echo-server.json
sed -i -e "s%{{ LARAVEL_ECHO_SERVER_SSL_KEY_PATH }}%$LARAVEL_ECHO_SERVER_SSL_KEY_PATH%g" laravel-echo-server.json
sed -i -e "s%{{ LARAVEL_ECHO_SERVER_SSL_CHAIN_PATH }}%$LARAVEL_ECHO_SERVER_SSL_CHAIN_PATH%g" laravel-echo-server.json
sed -i -e "s%{{ LARAVEL_ECHO_SERVER_SSL_PASSPHRASE }}%$LARAVEL_ECHO_SERVER_SSL_PASSPHRASE%g" laravel-echo-server.json
sed -i -e "s%{{ LARAVEL_ECHO_SERVER_ALLOW_CORS }}%$LARAVEL_ECHO_SERVER_ALLOW_CORS%g" laravel-echo-server.json
sed -i -e "s%{{ LARAVEL_ECHO_SERVER_ALLOW_ORIGIN }}%$LARAVEL_ECHO_SERVER_ALLOW_ORIGIN%g" laravel-echo-server.json
sed -i -e "s%{{ LARAVEL_ECHO_SERVER_ALLOW_METHODS }}%$LARAVEL_ECHO_SERVER_ALLOW_METHODS%g" laravel-echo-server.json
sed -i -e "s%{{ LARAVEL_ECHO_SERVER_ALLOW_HEADERS }}%$LARAVEL_ECHO_SERVER_ALLOW_HEADERS%g" laravel-echo-server.json

$@
