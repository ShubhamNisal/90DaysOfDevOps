FROM node:18-alpine

WORKDIR /app

COPY app.js .

RUN addgroup -S appgroup && adduser -S appuser -G appgroup

USER appuser

CMD ["node", "app.js"]
