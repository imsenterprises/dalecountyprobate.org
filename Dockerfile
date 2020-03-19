FROM cibuilds/hugo as hugo
COPY --chown=circleci:circleci ./ .
RUN hugo

FROM nginx
COPY --from=hugo /home/circleci/project/public /usr/share/nginx/html