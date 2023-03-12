FROM node:14.18.0-alpine
ENV NODE_ENV production

WORKDIR /usr/src/app
COPY ["package.json", "package-lock.json*","./"]

RUN apk update && apk upgrade && \
  apk add --no-cache bash git openssh

RUN npm config set unsafe-perm true
RUN npm install 

COPY . .
RUN npm run build
EXPOSE 3000
CMD ["npm", "run", "start"]