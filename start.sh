#!/bin/bash

#cat > /var/www/html/index.html <<EOF
cat > /usr/share/nginx/html/index.html <<EOF
<html>
<body bgcolor="$COLOR">
<h1>$TITLE</h1>

$BODY

<hr/>
hostname: $HOSTNAME
</body>
</html>
EOF

exec nginx -g "daemon off;"
