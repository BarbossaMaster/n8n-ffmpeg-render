# Usa imagem Debian com Node.js
FROM node:20-bullseye

# Instala dependências do sistema e FFmpeg
RUN apt-get update && \
    apt-get install -y ffmpeg python3 build-essential && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Instala n8n globalmente
RUN npm install -g n8n

# Copia nós personalizados
COPY ./custom-nodes /custom-nodes
ENV N8N_CUSTOM_EXTENSIONS="/custom-nodes"

# Porta padrão do n8n
EXPOSE 5678

# Volume persistente
VOLUME ["/home/node/.n8n"]

# Inicia o n8n
CMD ["n8n"]
