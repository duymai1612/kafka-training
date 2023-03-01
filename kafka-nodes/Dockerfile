FROM node:16-alpine

WORKDIR /app

COPY package.json .
RUN npm install

COPY producer.js .
COPY consumer.js .

CMD ["node", "producer.js"]