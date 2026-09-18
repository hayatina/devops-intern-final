FROM nginx:1.27-alpine

ARG BUILD_SHA=unknown

RUN addgroup -S -g 10001 nginxapp \
    && adduser -S -D -u 10001 -G nginxapp nginxapp \
    && mkdir -p /var/cache/nginx /var/run \
    && chown -R 10001:10001 /var/cache/nginx /var/run /usr/share/nginx/html /etc/nginx

COPY nginx.conf /etc/nginx/nginx.conf
COPY index.html /usr/share/nginx/html/index.html

RUN sed -i "s/BUILD_SHA/${BUILD_SHA}/g" /usr/share/nginx/html/index.html \
    && chown 10001:10001 /usr/share/nginx/html/index.html

USER 10001

EXPOSE 8080

HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
    CMD ["wget", "-q", "-O", "/dev/null", "http://127.0.0.1:8080/healthz"]

CMD ["nginx", "-g", "daemon off;"]
