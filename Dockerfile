FROM node:14-alpine

RUN mkdir -p /home/app/node && chown node /home/app/node
#RUN mkdir -p /home/app/node

WORKDIR /home/app/node

USER node

COPY package.json ${WORKDIR}

RUN yarn install

COPY . ${WORKDIR}

ENV HOST=0.0.0.0 PORT=3000

EXPOSE ${PORT}

CMD ["yarn", "start"]

#docker build . -t appdp
#docker images
#docker run -p 3000:3000 --name appdp -d appdp
#docker ps -a