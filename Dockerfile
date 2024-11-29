FROM node:22-alpine
WORKDIR /app

COPY package*.json ./

RUN npm ci --only=production

COPY . .

ENV NODE_ENV=production
ENV PORT=9090

CMD ["node", "index.js"]