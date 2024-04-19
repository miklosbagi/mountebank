FROM alpine:3.18.6

EXPOSE 2525

CMD ["mb"]

ENV NODE_VERSION=18.20.1-r0 NPM_VERSION=9.6.6-r0

RUN apk update \
 && apk add --no-cache nodejs=${NODE_VERSION} npm=${NPM_VERSION}

ENV MOUNTEBANK_VERSION=2.9.1

RUN npm install -g mountebank@${MOUNTEBANK_VERSION} --production \
 && npm cache clean --force 2>/dev/null \
 && rm -rf /tmp/npm*
