FROM node:13.12.0-alpine
WORKDIR /client
ENV PATH /client/node_modules/.bin:$PATH
COPY package.json /client
COPY package-lock.json /client
RUN npm install
CMD ["npm", "dev", "start"]
