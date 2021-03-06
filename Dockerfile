FROM node:alpine
MAINTAINER fatryst <fatryst@hotmail.com>

COPY files/ /opt/laravel-echo-server/
RUN \
	apk add --no-cache make g++ python3 py3-pip && \
	npm install -g laravel-echo-server --registry=http://registry.npm.taobao.org && \
	cd /opt/laravel-echo-server && \
	chmod +x entrypoint.sh

EXPOSE 6001
ENV \
	LARAVEL_ECHO_SERVER_DATABASE="redis" \
	LARAVEL_ECHO_SERVER_AUTH_HOST="http://localhost" \
	LARAVEL_ECHO_SERVER_DEBUG=false \
	LARAVEL_ECHO_SERVER_HOST="0.0.0.0" \
	LARAVEL_ECHO_SERVER_PORT=6001 \
	LARAVEL_ECHO_SERVER_SSL_CERT_PATH= \
	LARAVEL_ECHO_SERVER_SSL_KEY_PATH= \
	LARAVEL_ECHO_SERVER_SSL_CHAIN_PATH= \
	LARAVEL_ECHO_SERVER_SSL_PASSPHRASE= \
	LARAVEL_ECHO_SERVER_PROTOCOL="http" \
	LARAVEL_ECHO_SERVER_CLIENTS= \
	LARAVEL_ECHO_SERVER_DATABASE="redis" \
	LARAVEL_ECHO_SERVER_REDIS_HOSTNAME="redis" \
    	LARAVEL_ECHO_SERVER_REDIS_PORT=6379 \
    	LARAVEL_ECHO_SERVER_REDIS_PASSWORD= \
    	LARAVEL_ECHO_SERVER_REDIS_KEYPREFIX= \
    	LARAVEL_ECHO_SERVER_REDIS_DB=0 \
    	LARAVEL_ECHO_SERVER_SQLITE_DATABASEPATH= \
	LARAVEL_ECHO_SERVER_DEVMODE=false \
	LARAVEL_ECHO_SERVER_CLIENTS=[] \
	LARAVEL_ECHO_SERVER_ALLOW_CORS=true \
	LARAVEL_ECHO_SERVER_ALLOW_ORIGIN="http://localhost:80" \
	LARAVEL_ECHO_SERVER_ALLOW_METHODS="GET, POST" \
	LARAVEL_ECHO_SERVER_ALLOW_HEADERS="Origin, Content-Type, X-Auth-Token, X-Requested-With, Accept, Authorization, X-CSRF-TOKEN, X-Socket-Id"

WORKDIR /opt/laravel-echo-server
ENTRYPOINT ["/opt/laravel-echo-server/entrypoint.sh"]
CMD ["laravel-echo-server", "start"]
