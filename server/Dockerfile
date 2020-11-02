FROM node:13.12.0-alpine
WORKDIR /server
ENV PATH /server/node_modules/.bin:$PATH
COPY package.json /server
RUN npm install
COPY wait-for-mongo.sh /server
CMD ["npm", "dev", "start"]
