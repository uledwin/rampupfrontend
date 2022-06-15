FROM node:18-alpine
#FROM node:16-bullseye-slim

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./


RUN npm install
RUN npm install -g npm
RUN npm audit fix --force
# If you are building your code for production
# RUN npm ci --only=production

# Bundle app source
COPY . .
EXPOSE 3030

RUN npm install pm2 -g
CMD [ "pm2-runtime", "frontend.js" ]
