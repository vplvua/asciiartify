FROM node:22.5.1
WORKDIR /app
COPY . .
RUN npm ci && npm run build

FROM nginx:1.27.0
COPY --from=0 /app/build /usr/share/nginx/html