# Stage 1: Build
FROM node:22.5.1
WORKDIR /app
COPY . .
RUN npm ci && npm run build

# Stage 2: Serve
FROM nginx:1.27.0
COPY --from=0 /app/build /usr/share/nginx/html