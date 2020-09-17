FROM wordpress:${WP_VERSION}
#Install required tools:
RUN apk --no-cache add tar curl
# Install phpredis extension
RUN docker-php-source extract \
&& curl -L -o /tmp/redis.tar.gz https://github.com/phpredis/phpredis/archive/${PHPREDIS_VERSION}.tar.gz \
&& tar -xvzf /tmp/redis.tar.gz \
&& mv phpredis-${PHPREDIS_VERSION} /usr/src/php/ext/redis \
&& docker-php-ext-install redis \
&& docker-php-source delete \
&& rm -r /tmp/*
