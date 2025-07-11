FROM node as builder

WORKDIR /app

COPY package.json package-lock.json ./

RUN npm install

COPY . .

RUN npm run build 

FROM nginx:latest 

COPY --from=builder /app/dist/angular-jenkin /usr/share/nginx/html

