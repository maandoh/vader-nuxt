FROM mhart/alpine-node:12

WORKDIR /app

COPY . .

RUN npm i -g yarn
RUN yarn
RUN yarn build

EXPOSE 3000
ENV NUXT_HOST=0.0.0.0
ENV NUXT_PORT=3000

# start the app
CMD [ "yarn", "start" ]
