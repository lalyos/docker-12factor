#!/bin/bash

cat > /var/www/html/index.nginx-debian.html <<EOF
<html>
  <head>
    <style>
  * { box-sizing: border-box; }
  body { display: grid; place-items: center; min-height: 100vh; background: hsl(0 0% 20%); }
  .boujee-text { --bg-size: 400%; --color-one: hsl(1 90% 55%); --color-two: hsl(80 95% 55%); font-family: sans-serif; font-size: clamp(3rem, 25vmin, 8rem); background: linear-gradient( 90deg, var(--color-one), var(--color-two), var(--color-one) ) 0 0 / var(--bg-size) 100%; color: transparent; -webkit-background-clip: text; background-clip: text; }
  @media (prefers-reduced-motion: no-preference) {
    .boujee-text { -webkit-animation: move-bg 3s linear infinite; animation: move-bg 3s linear infinite; }
    @-webkit-keyframes move-bg { to { background-position: var(--bg-size) 0; } }
    @keyframes move-bg { to { background-position: var(--bg-size) 0; } }
  }
    </style>
  </head>
  <body>
    <h1 class="boujee-text">${TITLE}</h1>
  </body>
</html>
EOF

exec nginx -g "daemon off;"
