# Usa imagem Debian com Node.js
FROM node:18-bullseye

# Instala o FFmpeg
RUN apt-get update && \
    apt-get install -y ffmpeg && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Cria pasta de trabalho
WORKDIR /usr/src/app

# Instala o n8n
RUN npm install n8n -g

# Expõe a porta padrão do n8n
EXPOSE 5678

# Comando para iniciar o n8n
CMD ["n8n"]
