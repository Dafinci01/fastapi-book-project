version: "3.8"
services:
  app:
    build: .
    container_name: fastapi-app
    ports:
      - "8000:8000"
  nginx:
    image: nginx:latest
    container_name: nginx
    ports:
      - "80:80"
    volumes:
      - ./nginx.conf:/etc/nginx/conf.d/default.conf:ro
    depends_on:
      - app

