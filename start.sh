#!/bin/bash


echo -n "${FAIL:=0}" > /tmp/fail
chown nginx:nginx /tmp/fail

if [[ ! "$BODYSTYLE" ]]; then 
  BODYSTYLE="background: ${COLOR}"
  [ -z $COLOR2 ] || BODYSTLE="background: linear-gradient(${COLOR}, 80%, ${COLOR2})"
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
