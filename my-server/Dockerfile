FROM node:16-alpine

WORKDIR /app
COPY package*.json ./
RUN npm install

#ENV DB_HOST=mariadb-service.pcc.svc.cluster.local
#ENV DB_USER=root

COPY . .

CMD ["npm", "start"]