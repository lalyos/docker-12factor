FROM nginx:alpine
RUN apk add bash
ENV TITLE=Welcome
ENV BODY="Please use BODY/TITLE/COLOR env variables"
ENV COLOR=lightblue
COPY readiness.js /etc/nginx/njs/
COPY nginx.conf /etc/nginx/
COPY start.sh /
RUN chmod +x /start.sh
RUN ln -sf /dev/stdout /var/log/nginx/access.log \
    && ln -sf /dev/stderr /var/log/nginx/error.log
EXPOSE 80
CMD [ "/start.sh" ]
