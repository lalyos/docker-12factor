#!/bin/bash

printf "\033[44m%s\033[49m\n" $HOSTNAME > /var/www/html/index.html
nginx -g "daemon off;"
