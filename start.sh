#!/bin/bash

# usage: file_env VAR [DEFAULT]
#    ie: file_env 'XYZ_DB_PASSWORD' 'example'
# (will allow for "$XYZ_DB_PASSWORD_FILE" to fill in the value of
#  "$XYZ_DB_PASSWORD" from a file, especially for Docker's secrets feature)
file_env() {
	local var="$1"
	local fileVar="${var}_FILE"
	local def="${2:-}"
	if [ "${!var:-}" ] && [ "${!fileVar:-}" ]; then
		mysql_error "Both $var and $fileVar are set (but are exclusive)"
	fi
	local val="$def"
	if [ "${!var:-}" ]; then
		val="${!var}"
	elif [ "${!fileVar:-}" ]; then
		val="$(< "${!fileVar}")"
	fi
	export "$var"="$val"
	unset "$fileVar"
}

file_env FAIL 0
file_env TITLE Welcome
file_env COLOR lightblue
file_env COLOR2
file_env BODY "Please use BODY/TITLE/COLOR env variables (COLOR2 for gradient)"

echo -n "${FAIL:=0}" > /tmp/fail
chown nginx:nginx /tmp/fail

if [[ ! "$BODYSTYLE" ]]; then 
  BODYSTYLE="background: ${COLOR}"
  [ -z $COLOR2 ] || BODYSTYLE="background: linear-gradient(${COLOR}, 80%, ${COLOR2})"
fi

cat > /usr/share/nginx/html/index.html <<EOF
<html>
<body style="${BODYSTYLE};">
<h1>$TITLE</h1>

$BODY

<hr/>
hostname: $HOSTNAME
<br>
<a href="/ready" target="_blank" >readiness</a>
&nbsp;(Fail next: 
&nbsp;<a target="hidden" href="/failnext?count=1">1</a>
&nbsp;<a target="hidden" href="/failnext?count=3">3</a>
&nbsp;<a target="hidden" href="/failnext?count=5">5</a>
&nbsp;<a target="hidden" href="/failnext?count=10">10</a>)

<iframe name="hidden" hidden></iframe>

</body>
</html>
EOF

exec nginx -g "daemon off;"
