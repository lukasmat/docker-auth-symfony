#!/bin/sh
set -e

# first arg is `-f` or `--some-option`
if [ "${1#-}" != "$1" ]; then
	set -- php-fpm "$@"
fi

if [ "$1" = 'php-fpm' ] || [ "$1" = 'bin/console' ]; then
	if [ "$APP_ENV" != 'prod' ]; then
		composer install --prefer-dist --no-progress --no-suggest --no-interaction
	fi

	until php bin/console doctrine:database:create --if-not-exists >/dev/null 2>&1; do
	    (>&2 echo "Waiting for MySQL to be ready...")
		sleep 1
	done

	if [ "$(ls -A src/Migrations/*.php 2> /dev/null)" ]; then
		php bin/console doctrine:migrations:migrate --no-interaction
		php bin/console doctrine:fixtures:load --no-interaction
	fi
fi

exec docker-php-entrypoint "$@"
