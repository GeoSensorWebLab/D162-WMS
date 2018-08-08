FROM node:8

WORKDIR /app

COPY package.json /app
RUN npm install
COPY . /app

# By default, run the WMS.
# This can be overridden in `docker run` to start other services.
CMD node index.js

# 3000 is the port for the WMS
EXPOSE 3000
