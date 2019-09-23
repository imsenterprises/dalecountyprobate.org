ARG IMAGE=amd64/nginx
FROM cibuilds/hugo as hugo
WORKDIR /app
COPY ./ .
RUN hugo

FROM $IMAGE
COPY --from=hugo /app/public /usr/share/nginx/html