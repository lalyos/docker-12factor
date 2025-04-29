FROM nginx:alpine
RUN apk add bash
COPY readiness.js /etc/nginx/njs/
COPY nginx.conf /etc/nginx/
COPY start.sh /
RUN chmod +x /start.sh
EXPOSE 80
CMD [ "/start.sh" ]
