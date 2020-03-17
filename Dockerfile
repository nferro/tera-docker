# builder
FROM node:alpine

RUN apk update
RUN apk add python build-base

RUN adduser -s /bin/bash -D tera
USER tera

COPY --chown=tera ./tera/Source /tera
WORKDIR /tera

RUN npm install
COPY --chown=tera ./scripts/* /tera/


# final
FROM node:alpine

RUN adduser -s /bin/bash -D tera
USER tera

COPY --from=0 /tera /tera
WORKDIR /tera

ENTRYPOINT [ "/tera/run-node.sh" ]