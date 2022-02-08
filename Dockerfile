FROM node:14-alpine

# Install system dependencies
RUN apk add --no-cache alpine-sdk
RUN apk add --no-cache bash

# Mount application
RUN mkdir -p /docker-alt/client
WORKDIR /docker-alt/client

# Copy and Install dependencies into the cache
COPY package*.json ./
RUN npm install --unsafe-perm
# --unsafe-perm flag is used to resolve issue with execution of preinstall script

ENV PATH ./node_modules/.bin:$PATH

ENV NODE_ENV=development
ENV REACT_APP_STAGE=development

ENTRYPOINT [ "docker-entrypoint.sh" ]

EXPOSE 3000
