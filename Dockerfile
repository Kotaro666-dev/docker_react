# # BUILD FHASE
# FROM node:alpine as builder

# WORKDIR '/app'

# COPY package*.json ./
# RUN npm install
# COPY ./ ./

# RUN npm run build

# # RUN PHASE

# FROM nginx
# EXPOSE 80
# # REF: https://hub.docker.com/_/nginx
# COPY --from=0 /app/build /usr/share/nginx/html

FROM node:alpine
WORKDIR '/app'
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=0 /app/build /usr/share/nginx/html