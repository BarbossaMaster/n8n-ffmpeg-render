# Usa imagem base do Node.js com apt-get disponível
FROM node:20-slim

# Instala dependências do sistema e FFmpeg
USER root
RUN apt-get update && \
    apt-get install -y ffmpeg python3 curl git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Instala o n8n globalmente
RUN npm install -g n8n

# Instala os nós personalizados do OpenAI
RUN npm install -g n8n-nodes-openai@latest

# Cria diretório de trabalho
WORKDIR /data

# Define usuário padrão do container
USER node

# Inicia o n8n
CMD ["n8n"]
