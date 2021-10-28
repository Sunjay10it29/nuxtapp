FROM node:16.12.0-alpine3.11

RUN mkdir -p /src/nuxt-app
WORKDIR /src/nuxt-app

# update and install dependency
RUN apk update && apk upgrade
RUN apk add git

# copy the app, note .dockerignore
COPY . /src/nuxt-app/
RUN yarn install

# build necessary, even if no static files are needed,
# since it builds the server as well
RUN yarn run build

# expose 5000 on container
EXPOSE 18080

# set app serving to permissive / assigned
ENV NUXT_HOST=0.0.0.0
# set app port
ENV NUXT_PORT=18080

# start the app
CMD [ "yarn", "start" ]