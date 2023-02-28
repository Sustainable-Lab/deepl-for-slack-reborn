FROM node:latest

RUN mkdir -p /deepl-for-aws
WORKDIR /deepl-for-aws

COPY package*.json ./
RUN npm install

COPY . ./
EXPOSE 3000

CMD ["npm", "start"]
