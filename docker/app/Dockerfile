# 1. For build Svelte app
FROM node:16.13.2-alpine AS development

# Set working directory
WORKDIR /app

COPY package.json /app/package.json
COPY yarn.lock /app/yarn.lock

RUN yarn install --frozen-lockfile

COPY . /app

ENV CI=true
ENV PORT=3000

CMD [ "yarn", "start" ]

FROM development AS build

RUN yarn build

# 2. For Nginx setup
FROM nginx:alpine

# Copy config nginx
COPY --from=build /app/docker/nginx/default.conf /etc/nginx/conf.d/default.conf

WORKDIR /usr/share/nginx/html

# Remove default nginx static assets
RUN rm -rf ./*

# Copy static assets from builder stage
COPY --from=build /app/dist .

# Containers run nginx with global directives and daemon off
ENTRYPOINT ["nginx", "-g", "daemon off;"]