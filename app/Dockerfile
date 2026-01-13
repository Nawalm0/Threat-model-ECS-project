
FROM node:20-alpine AS builder


WORKDIR /app


COPY package.json yarn.lock ./


RUN yarn install --frozen-lockfile


COPY . .


RUN yarn build



FROM node:20-alpine


WORKDIR /app


RUN addgroup -S appgroup && adduser -S appuser -G appgroup


RUN npm install -g serve


COPY --from=builder /app/build ./build


RUN chown -R appuser:appgroup /app


USER appuser

EXPOSE 3000

CMD ["serve", "-s", "build", "-l", "tcp://0.0.0.0:3000"]
 