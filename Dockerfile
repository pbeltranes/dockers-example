FROM node:10
# Install graphics magick
RUN apt-get update && apt-get install -y graphicsmagick
# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./

RUN npm install
# If you are building your code for production
# RUN npm ci --only=production
# Bundle app source
COPY . .

EXPOSE 80

CMD [ "node", "index.js" ]
