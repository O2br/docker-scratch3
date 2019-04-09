FROM alpine

ENV NODE_ENV production

RUN apk add --no-cache nodejs git npm \
    && mkdir -p /usr/src/app \
    && cd /usr/src/app \
    && git clone https://github.com/LLK/scratch-gui.git \
    && cd scratch-gui \
    && npm install -f \
    && sed -ri -e "s/8601/80,\n disableHostCheck: true/" ./webpack.config.js

WORKDIR /usr/src/app/scratch-gui
EXPOSE 80
CMD ["npm","start"]
