FROM ubuntu:18.04
RUN apt-get update -qq
RUN apt-get install -y nginx curl
ENV TITLE=Welcome
ENV BODY="Please use BODY/TITLE/COLOR env variables"
ENV COLOR=lightblue
COPY start.sh /
RUN chmod +x /start.sh
RUN ln -sf /dev/stdout /var/log/nginx/access.log \
    && ln -sf /dev/stderr /var/log/nginx/error.log
EXPOSE 80
CMD [ "/start.sh" ]
