# Utiliza una imagen base de Node.js en Alpine
FROM node:18-alpine

# Crea un directorio de trabajo dentro del contenedor
WORKDIR /usr/src/app

# Cambiar permisos de la carpeta
RUN chown node:node ./

# Cambiar a un usuario no-root
USER node

# Copia el archivo de dependencias de la aplicación al directorio de trabajo e instala las dependencias
COPY package.json package-lock.json* ./
RUN npm ci && npm cache clean --force
COPY ./src ./src

# Establece la variable de entorno para el puerto
ENV PORT=3000

# Expón el puerto definido en la variable de entorno PORT
EXPOSE $PORT

# Comando para ejecutar la aplicación
CMD ["node", "./src/index.js"]
