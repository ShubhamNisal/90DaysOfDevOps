# Multi-stage Dockerfile
# Stage 1: Build
FROM node:18 AS builder
WORKDIR /app
COPY app.js .

# Stage 2: Run
FROM node:18-alpine
WORKDIR /app
COPY --from=builder /app/app.js .
CMD ["node", "app.js"]
