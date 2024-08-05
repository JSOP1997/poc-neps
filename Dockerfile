# Usa una imagen base de Node.js para construir el proyecto
FROM node:20-alpine AS builder

# Establece el directorio de trabajo
WORKDIR /app

# Copia el package.json y el package-lock.json
COPY package*.json ./

# Instala las dependencias del proyecto
RUN npm install

# Copia el código fuente al contenedor
COPY . .

# Compila el proyecto
RUN npm run build

# Usa una imagen base de Nginx para servir el contenido
FROM nginx:alpine

# Copia los archivos compilados a la carpeta de Nginx
COPY --from=builder /app/dist /usr/share/nginx/html
COPY nginx.conf /etc/nginx/nginx.conf

# Expone el puerto en el que Nginx escucha
EXPOSE 80

# Inicia Nginx en primer plano
CMD ["nginx", "-g", "daemon off;"]

